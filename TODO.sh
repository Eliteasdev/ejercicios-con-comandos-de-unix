#!/bin/bash

# Archivo que almacena las tareas
archivo_tareas="tareas.txt"

# Verifica si el archivo de tareas existe, si no, lo crea
if [ ! -f "$archivo_tareas" ]; then
    touch "$archivo_tareas"
fi

# Función para mostrar la tabla de tareas
function mostrar_tareas() {
    echo "| Tarea                     | Estado              | Fecha de creación | Fecha de finalización |"
    echo "|-------------------|-----------------|-------------------|-----------------------|"
    while IFS= read -r linea; do
        tarea=$(echo "$linea" | cut -d',' -f1)
        estado=$(echo "$linea" | cut -d',' -f2)
        fecha_creacion=$(echo "$linea" | cut -d',' -f3)
        fecha_finalizacion=$(echo "$linea" | cut -d',' -f4)
        echo "| $tarea | $estado  | $fecha_creacion        | $fecha_finalizacion                 |"
    done < "$archivo_tareas"
}

# Función para agregar una nueva tarea
function agregar_tarea() {
    echo "Ingrese la descripción de la tarea:"
    read -r descripcion
    echo "Ingrese el estado de la tarea:"
    read -r estado
    fecha_creacion=$(date +"%d-%m-%Y")
    echo "$descripcion,$estado,$fecha_creacion,-" >> "$archivo_tareas"
    echo "Tarea agregada exitosamente."
}

# Función para modificar una tarea existente
function modificar_tarea() {
    echo "Ingrese el número de línea de la tarea que desea modificar:"
    read -r numero_linea
    tarea_actual=$(sed -n "${numero_linea}p" "$archivo_tareas")
    if [ -z "$tarea_actual" ]; then
        echo "No se encontró ninguna tarea con el número de línea especificado."
        return
    fi
    echo "Tarea actual: $tarea_actual"
    echo "Ingrese la nueva descripción de la tarea:"
    read -r nueva_descripcion
    echo "Ingrese el nuevo estado de la tarea:"
    read -r nuevo_estado
    fecha_creacion=$(echo "$tarea_actual" | cut -d',' -f3)
    echo "$nueva_descripcion,$nuevo_estado,$fecha_creacion,-" > tmp.txt
    sed -e "${numero_linea}s/.*/$(cat tmp.txt)/" "$archivo_tareas" > "$archivo_tareas.tmp"
    mv "$archivo_tareas.tmp" "$archivo_tareas"
    rm tmp.txt
    echo "Tarea modificada exitosamente."
}

# Función para borrar una tarea existente
function borrar_tarea() {
    echo "Ingrese el número de línea de la tarea que desea borrar:"
    read -r numero_linea
    tarea_actual=$(sed -n "${numero_linea}p" "$archivo_tareas")
    if [ -z "$tarea_actual" ]; then
        echo "No se encontró ninguna tarea con el número de línea especificado."
        return
    fi
    sed -i "${numero_linea}d" "$archivo_tareas"
    echo "Tarea borrada exitosamente."
}

# Función para exportar las tareas en formato Markdown
function exportar_tareas() {
    echo "| Tarea                     | Estado              | Fecha de creación | Fecha de finalización |"
    echo "|-------------------|-----------------|-------------------|-----------------------|"
    cat "$archivo_tareas" | while IFS= read -r linea; do
        tarea=$(echo "$linea" | cut -d',' -f1)
        estado=$(echo "$linea" | cut -d',' -f2)
        fecha_creacion=$(echo "$linea" | cut -d',' -f3)
        fecha_finalizacion=$(echo "$linea" | cut -d',' -f4)
        echo "| $tarea | $estado  | $fecha_creacion        | $fecha_finalizacion                 |"
    done
}

# Menú principal
while true; do
    echo "----- TODO App -----"
    echo "1. Mostrar tareas"
    echo "2. Agregar tarea"
    echo "3. Modificar tarea"
    echo "4. Borrar tarea"
    echo "5. Exportar tareas en Markdown"
    echo "6. Salir"
    echo "Seleccione una opción:"
    read -r opcion
    case $opcion in
        1) mostrar_tareas;;
        2) agregar_tarea;;
        3) modificar_tarea;;
        4) borrar_tarea;;
        5) exportar_tareas;;
        6) break;;
        *) echo "Opción inválida";;
    esac
    echo
done
