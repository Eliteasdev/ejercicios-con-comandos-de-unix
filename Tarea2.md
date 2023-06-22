1. Abre dos terminales.
2. En una terminal corre el programa de python.
```bash
user@host:~$ python suma.py 
```
3. En la terminal 2 usa el comando adecuado para encontrar el PID de suma.py y toma captura.

```bash
user@host:~$ ps -e | grep python
   2371 pts/1    00:00:01 python
```
4. Mata el proceso en la que corriste "suma.py" antes de que termine de ejecutar el programa.
5. Vuelve a usar el comando para visualizar el estatus de procesos en la terminal 2, toma captura y explica lo que ves.
```bash
# Antes:
user@host:~$ ps -e | grep -e bash -e python
   2176 pts/0    00:00:00 bash
   2205 pts/1    00:00:00 bash
   2459 pts/1    00:00:01 python

# Despues
user@host:~$ ps -e | grep -e bash -e python
   2176 pts/0    00:00:00 bash
```
__Explicación__: Esto se debe a que al matar el proceso bash donde corria nuestro programa de python, como este era un hijo del proceso bash, al finalizar el proceso padre tambien finalizó el proceso hijo (suma.py).

6. Vuelve a la terminal 1 y use el comando adecuado para ejecutar "suma.py" y que el proceso no dependa del bash.
```bash
user@host:~$ nohup python suma.py&
```
7. En la terminal 2 vuelve a usar el comando para visualizar el estatus de procesos y toma captura. 
```bash
user@host:~$ ps -e | grep -e bash -e python
   2176 pts/0    00:00:00 bash
   2489 pts/1    00:00:00 bash
   2497 pts/2    00:00:00 bash
   2580 pts/1    00:00:01 python
```
8. Cierra la terminal 1 en la que corriste "suma.py" antes de que termine de ejecutar el programa.
9. En la terminal 2 vuelve a usar el comando para visualizar el estatus de procesos, toma captura y explica lo que ves.
```bash
user@host:~$ ps -e | grep -e bash -e python
   2176 pts/0    00:00:00 bash
   2795 ?        00:00:07 python
```
__Explicación__: Al agregar nohub estamos haciendo que el padre del proceso que deseamos ejecutar sea el primer proceso o proceso root 0, por lo que este ya no depende del bash en el que fue ejecutado. Por ello al finalizar el proceso bash, el proceso de python "suma.py" se ejecutará hasta completarse.