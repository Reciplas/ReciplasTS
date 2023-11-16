from decimal import Decimal
from faker import Faker
import random
import sqlite3
import os
from datetime import datetime, timedelta

fecha_actual = datetime.now()
fake = Faker('es_ES')

data = []

estados_de_envio = ['Fabricación', 'Pendiente', 'Finalizado']
formas_de_pago = ['Efectivo', 'Transferencia', 'Cuotas']
cuotas_posibles = [1, 3, 6, 9, 12]
for i in range(1,300): #ver cuantos clientes hay, ese debe ser el rango superior
    dias=365
    cant=random.randint(0, 20)
    for j in cant:
        fecha = (fecha_actual - timedelta(days=dias)).strftime("%Y-%m-%d")
        cliente = random.randint(1, 1000)
        forma_pago = random.choice(formas_de_pago)
        cuotas_cant= random.choice(cuotas_posibles)
        cuotas_pagas = random.randint(1, cuotas_cant)
        cuotas = str(cuotas_pagas) + "/" + str(cuotas_cant)
        total = round(float(Decimal(random.uniform(2000, 80000))), 2)
        estado = random.choice(estados_de_envio)
        fecha_creacion = fecha
        fecha_modificacion = fecha
        data.append((cliente, forma_pago, cuotas, total, estado, fecha_creacion, fecha_modificacion))

    dias-=1
# Especifica la ruta completa del archivo de la base de datos
base_de_datos = os.path.join(
        "/home/lautaro/personal/ReciplasTS/backend/raiz/resiplas"
        ,"db.sqlite3")

# Conectar a la base de datos SQLite (o crearla si no existe)
conn = sqlite3.connect(base_de_datos)

# Crear un cursor
cursor = conn.cursor()

try:
    cursor.executemany('''
        INSERT INTO pedidos(cliente, forma_pago, cuotas, total, estado, fecha_creacion, fecha_modificacion)
            VALUES (?, ?, ?, ?, ?)
    ''', data)
    conn.commit()
    print("Datos insertados en pedido")
except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor.close()
    conn.close()
