from decimal import Decimal
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

tipos_de_plastico = ['PEBD', 'PS', 'PVC', 'PET', 'PP']

data = []


tipos_de_presentacion = ['Caja de carton', 'Bolsa', 'Caja de madera', 'Simple']
for i in range(1, 20):
    plastico = random.choice(tipos_de_plastico)
    descripcion = fake.text(max_nb_chars=150)
    presentacion = random.choice(tipos_de_presentacion)
    stock_act = random.randint(1, 1000)
    # Asegurarse de que stock_inf esté entre 20 y 50
    stock_inf = random.randint(20, 50)
    precio = Decimal(random.uniform(1, 100))
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'
    data.append((plastico, descripcion, presentacion, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado))

connection = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='',
    db='api'
)

cursor = connection.cursor()

try:
    if connection is not None and connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""
            INSERT INTO materia_prima(plastico, descripcion, presentacion, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, data)
        connection.commit()
        print("Datos insertados en Materiaprima")
except mysql.connector.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()