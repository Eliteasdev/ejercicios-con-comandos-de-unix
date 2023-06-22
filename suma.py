import time
inicio = time.time()
suma = 0.0
delta = 1.0
for c in range(90000000):
	delta = delta / 2
	suma = suma + delta
print("el resultado es:", suma)
fin = time.time()
print("El tiempo invertido fue de ", fin-inicio, "segundos")
