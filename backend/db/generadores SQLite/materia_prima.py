from decimal import Decimal
from faker import Faker
import random
import sqlite3
import os
from datetime import datetime, timedelta

fake = Faker('es_ES')
fecha_actual = datetime.now()


tipos_de_plastico = ['PEBD', 'PS', 'PVC', 'PET', 'PP']

data = []


tipos_de_presentacion = ['Caja de carton', 'Bolsa', 'Caja de madera', 'Simple']

descripciones_materias_primas = [
    'Resina de polietileno de alta densidad reciclado, apta para la fabricación de botellas y envases.',
    'Polipropileno virgen de alta densidad para la producción de recipientes resistentes y duraderos.',
    'Materia prima compuesta de diferentes plásticos reciclados, ideal para aplicaciones diversas.',
    'Poliestireno reciclado, perfecto para la fabricación de envases y productos desechables.',
    'Mezcla de polímeros reciclados, adecuada para la elaboración de artículos plásticos diversos.',
    'Polipropileno reciclado con propiedades mejoradas, utilizado en la producción de componentes automotrices.',
    'Resina de polietileno de baja densidad, versátil y resistente, utilizada en la industria del embalaje.',
    'Compuesto de plásticos reciclados, apto para la fabricación de juguetes y productos de consumo.',
    'Polietileno de alta densidad virgen, ideal para aplicaciones que requieren resistencia y durabilidad.',
    'Polipropileno reciclado modificado, adecuado para la fabricación de mobiliario y productos industriales.'
    'Mezcla de plásticos reciclados para la producción sostenible de envases y utensilios de cocina.',
    'Polipropileno virgen con aditivos especiales, utilizado en la fabricación de componentes electrónicos.',
    'Resina de polietileno de baja densidad reciclado, ideal para la creación de películas y bolsas flexibles.',
    'Compuesto termoplástico reciclado, apto para la fabricación de artículos de jardinería.',
    'Poliestireno expandido reciclado, empleado en la elaboración de envases aislantes y productos de construcción.',
    'Mezcla de polímeros de alta resistencia, utilizado en la producción de piezas automotrices.',
    'Polietileno de baja densidad virgen, adecuado para la fabricación de productos médicos desechables.',
    'Plástico biodegradable derivado de almidón de maíz, respetuoso con el medio ambiente.',
    'Polipropileno modificado con fibras para mejorar la resistencia, utilizado en la fabricación de muebles.',
    'Resina de polietileno de alta densidad con propiedades antiestáticas, ideal para embalajes electrónicos.'
]


for i in range(1, 40):
    dias=365
    cant=random.randint(0, 2)
    for j in cant:
        fecha = (fecha_actual - timedelta(days=dias)).strftime("%Y-%m-%d")
        plastico = random.choice(tipos_de_plastico)
        descripcion = random.choice(descripciones_materias_primas)
        presentacion = random.choice(tipos_de_presentacion)
        stock_act = random.randint(1, 1000)
        # Asegurarse de que stock_inf esté entre 20 y 50
        stock_inf = random.randint(20, 50)
        precio = round(float(Decimal(random.uniform(1000, 10000))), 2)  # Convertir Decimal a float y redondear a 2 decimales
        fecha_creacion = fecha
        fecha_modificacion = fecha
        estado = 'Activo'
        data.append((plastico, descripcion, presentacion, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado))

    dias -=random.randint(5, 30)


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
