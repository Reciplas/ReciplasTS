from decimal import Decimal
from faker import Faker
import random
import sqlite3
import os

fake = Faker('es_ES')

data = []

# --> para generar personas
for i in range(1, 50):
    nombres = fake.first_name()
    apellido = fake.last_name()
    dni = random.randint(10000000, 99999999)
    fec_nac = fake.date_of_birth(minimum_age=18, maximum_age=65)
    celular = random.randint(600000000, 699999999)
    celular_alt = random.randint(600000000, 699999999)
    email = fake.email()
    direccion = fake.address()
    salario = round(float(Decimal(random.uniform(20000, 80000))), 2)  # Convertir Decimal a float y redondear a 2 decimales
    area = fake.job()
    cargo = fake.job()
    desde = fake.date_between(start_date='-5y', end_date='today')
    hasta = fake.date_between(start_date='-5y', end_date='today')
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'
    data.append(
        (nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, desde, hasta,
         fecha_creacion, fecha_modificacion, estado))

# Especifica la ruta completa del archivo de la base de datos
base_de_datos = os.path.join(
    'C:/Users/gonza/OneDrive - Facultad Regional Resistencia/6.PROYECTOS/ReciplasTS/backend/raiz/resiplas',
    'db.sqlite3')

# Conectar a la base de datos SQLite (o crearla si no existe)
conn = sqlite3.connect(base_de_datos)

# Crear un cursor
cursor = conn.cursor()

try:
    cursor.executemany('''
        INSERT INTO empleado(nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, desde, hasta, fecha_creacion, fecha_modificacion, estado)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en Empleado")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()
