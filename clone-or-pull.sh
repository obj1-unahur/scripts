#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/common"

[[ -z "$GITHUB_TOKEN" ]] && { echo "GitHub token not found, please ensure it is stored on \$GITHUB_TOKEN variable. You can generate one on https://github.com/settings/tokens, with at least 'repo' scope." ; exit 1; }

function continueToNextPage {
  NEW_COUNT=$(ls -1A . | wc -l)

  if [ $REPOS_COUNT -eq $NEW_COUNT ]; then
    break
  fi

  REPOS_COUNT=$NEW_COUNT
  PAGE_NUMBER=$((PAGE_NUMBER + 1))
}

function cloneOrPullRepo {
  re="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$"

  if [[ $1 =~ $re ]]; then
    REPO_HOME=${BASH_REMATCH[5]}
    REPO_USER=$(echo $REPO_HOME | rev | cut -d'-' -f 1 | rev)
    TP_NAME=$(echo $REPO_HOME | rev | cut -d'-' -f2-  | rev)
  fi

  if [ -d "$REPO_HOME" ]; then
    echo Pulling $REPO_HOME
    cd $REPO_HOME
    git pull
    cd ..
  else
    echo Cloning $REPO_HOME
    git clone $1
  fi
  renameWollokProyect $REPO_HOME $TP_NAME

}

TOKEN=$GITHUB_TOKEN
ORG=obj1-unahur-2018s2
URL="https://api.github.com/orgs/$ORG/repos?access_token="${TOKEN}"&per_page=200"
args=("$@")
echo Buscando repos para ${args[0]}
mkdir -p ${args[0]}
cd ${args[0]}
PAGE_NUMBER=1
REPOS_COUNT=0

while true ; do
  for r in $(curl  -s $URL"&page="$PAGE_NUMBER  | grep ssh_url |  grep ${args[0]}   | sed '/[ ]*"ssh_url":/!d;s/[^:]*: "//;s/",$//'); do
    cloneOrPullRepo $r &
  done

  continueToNextPage
done

wait

echo $REPOS_COUNT Cloned or updated.
