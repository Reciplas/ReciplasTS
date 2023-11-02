from decimal import Decimal
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

for i in range(1, 500):
    nombres = fake.first_name()
    apellido = fake.last_name()
    dni = random.randint(10000000, 99999999)
    fec_nac = fake.date_of_birth(minimum_age=18, maximum_age=65)
    celular = random.randint(600000000, 699999999)
    celular_alt = random.randint(600000000, 699999999)
    email = fake.email()
    direccion = fake.address()
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado='True'
    data.append((nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado))

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
            INSERT INTO cliente(nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, data)
        connection.commit()
        print("Datos insertados en Cliente")
except mysql.connector.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    connection.close()