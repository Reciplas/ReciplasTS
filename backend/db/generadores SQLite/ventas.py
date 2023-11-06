from decimal import Decimal
# from mysql.connector import Error
# import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta
import sqlite3
import os
fake = Faker('es_ES')

data = []
def generar_cuota():
    number1 = random.randint(1, 11)
    number2 = random.randint(number1 + 1, min(12, number1 + 1))
    if number2 > 12:
        number2 = 12
    return f"{number1}/{number2}"

for _ in range(1,100):
    cliente = fake.company()
    total = round(float(Decimal(random.uniform(2000, 80000))), 2)
    cuotas = generar_cuota()
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    data.append((cliente, total, cuotas, fecha_creacion, fecha_modificacion))

# Especifica la ruta completa del archivo de la base de datos
base_de_datos = os.path.join(
        "/home/lautaro/personal/ReciplasTS/backend/raiz/resiplas"
        ,"db.sqlite3")

# Conectar a la base de datos SQLite (o crearla si no existe)
conn = sqlite3.connect(base_de_datos)

# Crear un cursor
cursor = conn.cursor()

try:
    cursor.executemany('''
        INSERT INTO venta(cliente, total, cuotas, fecha_creacion, fecha_modificacion)
            VALUES (?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en venta")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()
