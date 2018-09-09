# Utilidades

## fix_projects_names.sh
Este script adapta el nombre del proyecto wollok para que corresponde con el repositorio de git al que pertenece. Esto nos va a permitir poder abrir el mismo ejercicio, por ejemplo pepita, de multiples estudiantes a la vez.

Modo de uso:

'$ ./fix-wollok-projects.sh'


## clone-or-pull.sh

Este script permite clone o actualizar repositorios de una organización filtrando por el nombre del repositorio. De esta forma podemos obtener todos los ejercicios resultos para un determinado ejercicio:

'$ ./clone_or_pull.sh pepita'

O podemos obtener todos los ejercicios entregados de determindo estudiante:

'$ ./clone_or_pull.sh mariaraven'
