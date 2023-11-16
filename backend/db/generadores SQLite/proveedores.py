from faker import Faker
import random
import sqlite3
import os
from datetime import datetime, timedelta
fake = Faker('es_ES')
fecha_actual = datetime.now()
data = []

proveedores = [
    'EcoPlásticos S.A.',
    'ReciMateriales Ltda.',
    'VerdeCiclo Suministros Industriales',
    'EcoSuministros Plásticos',
    'ReplastiSoluciones',
    'EcoInnovaciones Materias Primas',
    'CicloIndustria Sostenible',
    'PlastiProveeduría Ambiental',
    'ReciTech Suministros',
    'GreenPlastics Proveedores S.A.',
    'EcoMateriales Innovadores',
    'SosteniblePlásticos Internacional',
    'GreenCycle Suministros Industriales',
    'EcoProveedores de Polímeros',
    'RenovaSuministros Eco-Amigables',
    'NaturPlásticos Proveedor Global',
    'ReSolutions Materias Primas',
    'CicloVerde Suministros Reciclados',
    'EcoTech Suministros Renovables',
    'CicloMateriales Sustentables Ltda.'
]

for proveedor in proveedores:
    dias=365
    fecha = (fecha_actual - timedelta(days=dias)).strftime("%Y-%m-%d")

    razon_social = fake.company()
    nombre_fantasia = fake.company_suffix()
    cuit = random.randint(20000000000, 29999999999)
    celular = random.randint(3624000000, 3624999999)
    celular_alt = random.randint(3624000000, 3624999999)
    email = fake.email()
    direccion = fake.address()
    fecha_creacion = fecha
    fecha_modificacion = fecha
    estado = 'Activo'

    data.append((razon_social, nombre_fantasia, cuit, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado))
    dias -=random.randint(5, 30)

# Especifica la ruta completa del archivo de la base de datos
base_de_datos = os.path.join('C:/Users/gonza/OneDrive - Facultad Regional Resistencia/6.PROYECTOS/ReciplasTS/backend/raiz/resiplas', 'db.sqlite3')

# Conectar a la base de datos SQLite (o crearla si no existe)
conn = sqlite3.connect(base_de_datos)

# Crear un cursor
cursor = conn.cursor()


try:
    cursor.executemany('''
        INSERT INTO proveedores(razon_social, nombre_fantasia, cuit, celular, celular_alt, email, direccion, fecha_creacion, fecha_modificacion, estado)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en Proveedor")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()

