from decimal import Decimal
import random
from mysql.connector import Error
import mysql.connector
from faker import Faker
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

for i in range(1, 30):
    razon_social = fake.company()
    nombre_fantasia = fake.company_suffix()
    cuit = random.randint(20000000000, 29999999999)
    celular = random.randint(600000000, 699999999)
    celular_alt = random.randint(600000000, 699999999)
    email = fake.email()
    direccion = fake.address()
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'

    data.append((razon_social, nombre_fantasia, cuit, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado))

connection = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='',
    db='api'
)

cursor = connection.cursor()

try:
    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""
            INSERT INTO proveedor(razon_social, nombre_fantasia, cuit, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, data)
        connection.commit()
        print("Datos insertados en Proveedor")
except mysql.connector.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    connection.close()