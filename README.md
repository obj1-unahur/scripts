# Utilidades

## fix_projects_names.sh
Este script adapta el nombre del proyecto wollok para que corresponde con el repositorio de git al que pertenece. Esto nos va a permitir poder abrir el mismo ejercicio, por ejemplo pepita, de multiples estudiantes a la vez.

Modo de uso:

`$ ./fix_projects_names.sh`

## clone-or-pull.sh

Este scriptpermite clone o actualizar repositorios de una organización filtrando el nombre del repositorio con una keyword que  recibe por parámetro.
También soporta que los repositorios ya se encuentren clonados y en ese caso realiza un pull sobre el mismo.
Por último, en ambos casos, el script corrije el nombre del proyecto.

### Forma de uso

`$ ./clone_or_pull.sh keyword`

Podemos obtener todos los trabajos entregados para un determinado TP:

`$ ./clone_or_pull.sh pepita`

O podemos obtener todos los ejercicios entregados de determindo estudiante:

`$ ./clone_or_pull.sh mariaraven`

En cualquier caso el script va a crear, sino existe, una carpeta con el mismo y dentro de la misma van a quedar todos los repositorios clonados.

### Precondiciones

Para que el script funcione correctamente es necesario:

1. SSH Key registrada
2. Personal TOKEN
