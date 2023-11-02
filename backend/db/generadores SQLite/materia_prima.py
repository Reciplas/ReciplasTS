from decimal import Decimal
from mysql.connector import Error
from faker import Faker
import random

import sqlite3
import os

fake = Faker('es_ES')

tipos_de_plastico = ['PEBD', 'PS', 'PVC', 'PET', 'PP']

data = []


tipos_de_presentacion = ['Caja de carton', 'Bolsa', 'Caja de madera', 'Simple']
for i in range(1, 40):
    plastico = random.choice(tipos_de_plastico)
    descripcion = fake.text(max_nb_chars=150)
    presentacion = random.choice(tipos_de_presentacion)
    stock_act = random.randint(1, 1000)
    # Asegurarse de que stock_inf esté entre 20 y 50
    stock_inf = random.randint(20, 50)
    precio = round(float(Decimal(random.uniform(1000, 10000))), 2)  # Convertir Decimal a float y redondear a 2 decimales
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'
    data.append((plastico, descripcion, presentacion, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado))


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
        INSERT INTO materia_prima(plastico, descripcion, presentacion, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en Materiaprima")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()
