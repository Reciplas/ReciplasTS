from decimal import Decimal
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

for i in range(1, 40):
    cliente_id = random.randint(10000000, 99999999)
    empleado_id = random.randint(10000000, 99999999)
    total = 
    observacion =
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'

    data.append((cliente_id, empleado_id, total, observacion, fecha_creacion, fecha_modificacion, estado))

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
            INSERT INTO compra(cliente_id, empleado_id, total, observacion, fecha_creacion, fecha_modificacion, estado)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, data)
        connection.commit()
        print("Datos insertados en Compra")
except mysql.connector.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    connection.close()