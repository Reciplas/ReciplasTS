from decimal import Decimal
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta

fake = Faker('es_ES')

data = []

# --> para generar personas
for i in range(1,50):        
    nombres = fake.first_name()
    apellido = fake.last_name()
    dni=random.randint(10000000, 99999999)
    fec_nac=fake.date_of_birth(minimum_age=18, maximum_age=65)
    celular=random.randint(600000000, 699999999)
    celular_alt=random.randint(600000000, 699999999)
    email = fake.email()
    direccion=fake.address()
    salario=Decimal(random.uniform(20000, 80000))
    area=fake.job()
    cargo=fake.job()
    desde=fake.date_between(start_date='-5y', end_date='today')
    hasta=fake.date_between(start_date='-5y', end_date='today')
    fecha_creacion=fake.date_time_this_decade()
    fecha_modificacion=fake.date_time_this_decade()
    estado='True'
    data.append((nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, desde, hasta, fecha_creacion, fecha_modificacion,estado))




connection = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='',
    db='api'
)

# Crear un cursor para ejecutar consultas
cursor = connection.cursor()

try:

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.executemany("""INSERT INTO empleado(nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, desde, hasta, fecha_creacion, fecha_modificacion, estado) 
                                VALUES (%s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s)""", data)

        connection.commit()
        print("Datos insertados en Empleado")

except mysql.connector.Error as ex:
    print("Error during database operations: {}".format(ex))

finally:
    # Cerrar el cursor y la conexión a la base de datos
    cursor.close()
    connection.close() 