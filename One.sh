#!/bin/bash

# Este es un programa de saludo simple en Bash

# Solicita al usuario que ingrese su nombre
echo "¡Hola! ¿Cuál es tu nombre?"

# Lee la entrada del usuario
read nombre

# Muestra un saludo personalizado
echo "¡Hola, $nombre! ¡Bienvenido al mundo de Bash!"

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