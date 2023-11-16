from decimal import Decimal
from faker import Faker
import random
import sqlite3
import os
from datetime import datetime, timedelta
fake = Faker('es_ES')
fecha_actual = datetime.now()
data = []

areas = ['Producción', 'Compras', 'Ventas', 'Administración']
cargos = ['Operador', 'Encargado', 'Operador', 'Operador', 'Operador']

for i in range(1, 30):
    dias=365
    cant=random.randint(0, 2)
    for j in cant:
        fecha = (fecha_actual - timedelta(days=dias)).strftime("%Y-%m-%d")
        nombres = fake.first_name()
        apellido = fake.last_name()
        dni = random.randint(10000000, 55000000)
        fec_nac = fake.date_of_birth(minimum_age=18, maximum_age=65)
        celular = random.randint(3624000000, 3624999999)
        celular_alt = random.randint(3624000000, 3624999999)
        email = fake.email()
        direccion = fake.address()
        salario = round(float(Decimal(random.uniform(400000, 600000))), 2)  # Convertir Decimal a float y redondear a 2 decimales
        area = random.choice(areas)
        cargo = random.choice(cargos)
        desde = fake.date_between(start_date='-5y', end_date='today')
        fecha_creacion = fecha
        fecha_modificacion = fecha
        estado = 'Activo'
        data.append(
            (nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, desde,
            fecha_creacion, fecha_modificacion, estado))
        
    dias-=random.randint(5, 30)

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
        INSERT INTO empleados(nombres, apellido, dni, fec_nac, celular, celular_alt, email, direccion, salario, area, cargo, hasta, fecha_creacion, fecha_modificacion, estado)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en Empleado")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()
