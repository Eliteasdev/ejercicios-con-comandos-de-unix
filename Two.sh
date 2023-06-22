#!/bin/bash

# Este es un programa de saludo simple en Bash

# Solicita al usuario que ingrese su nombre
echo "¡Hola! ¿Cuál es tu nombre?"

# Lee la entrada del usuario
read nombre

# Muestra un saludo personalizado
echo "¡Hola, $nombre! ¡Bienvenido al mundo de Bash!"

# Pregunta al usuario qué color le gusta
echo "Dime, $nombre, ¿cuál es tu color favorito?"

# Lee la respuesta del usuario
read color

# Muestra un mensaje personalizado con el color favorito
echo "¡Qué interesante! El color favorito de $nombre es $color."

# Pregunta al usuario cuántas veces quiere repetir el saludo
echo "¿Cuántas veces quieres que repita el saludo?"

# Lee la respuesta del usuario
read repeticiones

# Verifica si la respuesta es un número válido
if [[ "$repeticiones" =~ ^[0-9]+$ ]]; then
    # Repite el saludo la cantidad de veces especificada
    for ((i=1; i<=repeticiones; i++)); do
        echo "Saludo número $i: ¡Hola, $nombre!"
    done
else
    echo "Lo siento, la entrada no es un número válido. No puedo repetir el saludo."
fi

# Pregunta si el usuario desea continuar
echo "¿Te gustaría seguir explorando Bash? (s/n)"

# Lee la respuesta del usuario
read respuesta

# Verifica la respuesta y muestra un mensaje apropiado
if [ "$respuesta" == "s" ]; then
    echo "¡Genial! ¡Disfruta tu tiempo con Bash!"
else
    echo "¡Espero verte de nuevo pronto! ¡Adiós!"
fi