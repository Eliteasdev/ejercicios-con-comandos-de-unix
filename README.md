# Ejercicio chmod
1. Crear el directoro Ejercicio.
```bash
Input:
mkdir Ejercicio

Output:
user@host:~$ ls
Comandos.md
```

2. Cear archivo nuevo de nombre texto1.txt
3. Cear archivo nuevo de nombre texto2.txt
4. Cear archivo nuevo de nombre texto3.txt
```bash
Input:
cd Ejercicio
touch texto1.txt texto2.txt texto3.txt
chmod -777 texto1.txt texto2.txt texto3.txt

Output:
user@host:~/Ejercicio$ ls
texto1.txt  texto2.txt  texto3.txt

```
5. Establece permisos de lectura, escritura y ejecución al owner, lectura y escritura al grupo y lectura al resto del mundo para el primer archivo.
```bash
Input:
chmod +764 texto1.txt

Output:
user@host:~/Ejercicio$ ls -l
total 0
-rwxrw-r-- 1 user user 0 jun 18 20:52 texto1.txt
---------- 1 user user 0 jun 18 20:52 texto2.txt
---------- 1 user user 0 jun 18 20:52 texto3.txt
```
6.  Establece permisos de lectura y escritura al owner, lectura y ejecución al grupo y ejecución al resto del undo para el segundo archivo.
```bash
Input:
chmod +651 texto2.txt

Output:
user@host:~/Ejercicio$ ls -l
total 0
-rwxrw-r-- 1 user user 0 jun 18 20:52 texto1.txt
-rw-r-x--x 1 user user 0 jun 18 20:52 texto2.txt
---------- 1 user user 0 jun 18 20:52 texto3.txt
```
7. Establece permisos de lectura y ejecucion al owner, ejecución al grupo y ningun permiso al resto del mundo para el primer archivo.
```bash
Input:
chmod +510 texto3.txt

Output:
user@host:~/Ejercicio$ ls -l
total 0
-rwxrw-r-- 1 user user 0 jun 18 20:52 texto1.txt
-rw-r-x--x 1 user user 0 jun 18 20:52 texto2.txt
-r-x--x--- 1 user user 0 jun 18 20:52 texto3.txt
```
8. Muestra los cambios con el comando adecuado.



```bash
Input:
ls -l

Output:
-rwxrw-r-- 1 user user 0 jun 18 20:52 texto1.txt
-rw-r-x--x 1 user user 0 jun 18 20:52 texto2.txt
-r-x--x--- 1 user user 0 jun 18 20:52 texto3.txt
```

# Ejercicio de permiso de ejecución en una carpeta
1. Crea una carpeta que se llame Practica
```bash
Input:
mkdir Practica

Output:
user@host:~$ ls
Practica
```
2. Dentro de la carpeta crea un archivo conextensión .sh y agrega el siguiente comando 'touch texto.txt'


```bash
Input:
nano ./Practica/programa.sh

Output:
user@host:~$ ls ./Practica/
programa.sh
user@host:~$ cat ./Practica/programa.sh 
touch texto.txt
```
3. Remueva el permiso de ejecución al owner, grupo y resto del mundo al directorio Practica.
```bash
Input:
chmod -111 ./Practica

Output:
user@host:~$ ls -l
drw-rw-r-- 2 user user 4096 jun 18 21:29 Practica
```

4. Intente ejecutar el archivo.sh y explique que es lo que ocurrió.
```bash
Input:
./Practica/programa.sh

Output:
bash: ./Practica/programa.sh: Permiso denegado
```
Hay dos problemas principales por los que no se puede ejecutar el programa, el primero es que no se puede acceder a la carpeta con permiso de ejecución por lo que la ruta no es ejecutable en si misma. Y el segundo problema es que al "programa.sh" en sí mismo nunca le dimos permisos de ejecución y al crear un archivo en unix/linux no cuenta con esos permisos por defecto, por lo que aunque no hubieramos removido los permisos de la carpeta aún así no podría ejecutarse el programa.

# Ejercicio cat, grep, cut y ls
1. Crear un nuevo directorio.
```bash
Input:
mkdir Ejercicio3
```
2. Crear un archivo ejercicio.txt en donde tendrá que contener un texto de minimo 3 lineas.
```bash
Input:
cd Ejercicio3
touch ejercicio.txt
```
3. Crear un archivo oculto ejercicio1.txt
```bash
Input:
touch .ejercicio1.txt
```
4. Listar los archivos en el directorio actual.
```bash
Input:
ls

Output:
user@host:~/Ejercicio3$ ls
ejercicio.txt
```
5. Listar los archivos en el directorio actual con los archivos ocultos.
```bash
Input:
ls -a

Output:
user@host:~/Ejercicio3$ ls -a
.  ..  .ejercicio1.txt  ejercicio.txtt
```
6. Leer el contenido del archivo ejercicio.txt
```bash
Input:
cat ejercicio.txt 

Output:
primer renglón
segundo renglón
tercer renglón

```
7. Pasar los primeros 5 caracteres de todas las lineas de ejercicio.txt a otro archivo de texto.
```bash
Input:
 cat ejercicio.txt | cut -c 1-5 > ejercicio_cut.txt

Output:
user@host:~/Ejercicio3$ cat ejercicio_cut.txt 
prime
segun
terce
```
8. Listar los archivos que se han creado en la hora actual.
```bash
Input:
ls -l | grep 22

Output:
user@host:~/Ejercicio3$ ls -la | grep 22
-rw-rw-r-- 1 user user    0 jun 18 22:08 .ejercicio1.txt
-rw-rw-r-- 1 user user   18 jun 18 22:13 ejercicio_cut.txt
-rw-rw-r-- 1 user user   49 jun 18 22:11 ejercicio.txt
```

