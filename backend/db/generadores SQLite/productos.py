from decimal import Decimal
from mysql.connector import Error
import mysql.connector
from faker import Faker
import random
from datetime import date, timedelta
import sqlite3
import os
fake = Faker('es_ES')

tipos_de_plastico = ['PEBD', 'PS', 'PVC', 'PET', 'PP']

data = []
productos = [
    {
        "nombre": "Botella EcoSplash",
        "descripcion": "Botella de agua reutilizable fabricada con plástico reciclado."
    },
    {
        "nombre": "Bolsa ReciBag",
        "descripcion": "Bolsa de compras ecológica hecha de plástico reciclado."
    },
    {
        "nombre": "Silla GreenLounge",
        "descripcion": "Muebles de jardín sostenibles hechos con plástico reciclado."
    },
    {
        "nombre": "Camiseta EcoBlend",
        "descripcion": "Prenda de vestir fabricada con fibras de plástico reciclado."
    },
    {
        "nombre": "Envases LimpioNature",
        "descripcion": "Envases de productos de limpieza doméstica fabricados con plástico reciclado."
    },
    {
        "nombre": "Juguete RePlayFun",
        "descripcion": "Juguetes sostenibles hechos de plástico reciclado."
    },
    {
        "nombre": "Panel Ecoluxe",
        "descripcion": "Paneles de construcción respetuosos con el medio ambiente fabricados con plástico reciclado."
    },
    {
        "nombre": "Maceta GreenGrow",
        "descripcion": "Macetas y contenedores de jardinería fabricados con plástico reciclado."
    },
    {
        "nombre": "Utensilios EcoKitchen",
        "descripcion": "Utensilios de cocina sostenibles hechos de plástico reciclado."
    },
    {
        "nombre": "Funda de teléfono RenewCase",
        "descripcion": "Fundas para teléfonos móviles fabricadas con plástico reciclado."
    },
    {
        "nombre": "Bicicleta ReCyclePro",
        "descripcion": "Bicicletas ecológicas con marcos de plástico reciclado."
    },
    {
        "nombre": "Tablero EcoSurf",
        "descripcion": "Tablas de surf sostenibles hechas con materiales reciclados."
    },
    {
        "nombre": "Reloj EcoTime",
        "descripcion": "Relojes con correas y carcasas de plástico reciclado."
    },
    {
        "nombre": "Lámpara GreenGlow",
        "descripcion": "Lámparas y luminarias respetuosas con el medio ambiente."
    },
    {
        "nombre": "Estuche RenewPack",
        "descripcion": "Estuches y maletas fabricados con plástico reciclado."
    },
    {
        "nombre": "Pelota PlayGreen",
        "descripcion": "Pelotas deportivas fabricadas con plástico reciclado."
    },
    {
        "nombre": "Auriculares ReSound",
        "descripcion": "Auriculares y audífonos sostenibles."
    },
    {
        "nombre": "Mochila EcoTrail",
        "descripcion": "Mochilas y mochileros confeccionados con materiales reciclados."
    },
    {
        "nombre": "Escritorio RecycleDesk",
        "descripcion": "Muebles de oficina ecológicos y escritorios sostenibles."
    },
    {
        "nombre": "Comida para Mascotas EcoPaws",
        "descripcion": "Alimentos y envases sostenibles para mascotas."
    },
    {
        "nombre": "Botella EcoHydrate",
        "descripcion": "Botellas reutilizables y respetuosas con el medio ambiente."
    },
    {
        "nombre": "Bolígrafo ReWrite",
        "descripcion": "Bolígrafos y material de escritura sostenibles."
    },
    {
        "nombre": "Cepillo RenewClean",
        "descripcion": "Cepillos de limpieza y utensilios de hogar sostenibles."
    },
    {
        "nombre": "Juguete GreenPlay",
        "descripcion": "Juguetes y juegos infantiles ecológicos."
    },
    {
        "nombre": "Zapatos RecycleStep",
        "descripcion": "Calzado y zapatillas hechos con plástico reciclado."
    },
    {
        "nombre": "Toallas EcoDry",
        "descripcion": "Toallas y productos de cuidado personal sostenibles."
    },
    {
        "nombre": "Muebles ReVive",
        "descripcion": "Muebles y decoración para el hogar fabricados con materiales reciclados."
    },
    {
        "nombre": "Lápices ReDraw",
        "descripcion": "Lápices y material de dibujo sostenibles."
    },
    {
        "nombre": "Maletín EcoCommute",
        "descripcion": "Maletines y accesorios para viajar respetuosos con el medio ambiente."
    },
    {
        "nombre": "Baterías GreenPower",
        "descripcion": "Baterías recargables y energía sostenible."
    }
]


tipos_de_presentacion = ['Caja de carton', 'Bolsa', 'Caja de madera', 'Simple']
for producto in productos:
    nombre = producto['nombre']
    descripcion = producto['descripcion']
    presentacion = random.choice(tipos_de_presentacion)
    lote = random.randint(100, 20000)
    stock_act = random.randint(1, 1000)
    # Asegurarse de que stock_inf esté entre 20 y 50
    stock_inf = random.randint(20, 50)
    precio = round(float(Decimal(random.uniform(2000, 80000))), 2)
    fecha_creacion = fake.date_time_this_decade()
    fecha_modificacion = fake.date_time_this_decade()
    estado = 'True'
    data.append((nombre, descripcion, presentacion, lote, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado))

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
        INSERT INTO producto(nombre, descripcion, presentacion, lote, stock_act, stock_inf, precio, fecha_creacion, fecha_modificacion, estado)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en producto")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()

