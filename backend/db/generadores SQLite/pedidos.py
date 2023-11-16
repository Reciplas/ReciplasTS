from decimal import Decimal
from faker import Faker
import random
import sqlite3
import os
from datetime import datetime, timedelta

fecha_actual = datetime.now()
fake = Faker('es_ES')

data = []
data_ln = []

estados_de_envio = ['Fabricación', 'Pendiente', 'Finalizado']
formas_de_pago = ['Efectivo', 'Transferencia', 'Cuotas']
cuotas_posibles = [1, 3, 6, 9, 12]

id_pedido=1

# Especifica la ruta completa del archivo de la base de datos
base_de_datos = os.path.join('C:/Users/gonza/OneDrive - Facultad Regional Resistencia/6.PROYECTOS/ReciplasTS/backend/raiz/reciplas', 'db.sqlite3')

# Conectar a la base de datos SQLite (o crearla si no existe)
conn = sqlite3.connect(base_de_datos)

# Crear un cursor
cursor_select = conn.cursor()

# Crear un cursor
cursor_insert = conn.cursor()

# Crear un cursor
cursor_insert_ln = conn.cursor()

try:
    # Consulta para obtener los precios de los productos 
    cursor_select.execute("SELECT id,precio FROM productos")

    # Obtener los resultados de la consulta
    productos = cursor_select.fetchall()

    for i in range(1,2): 
        dias=365
        fecha = (fecha_actual - timedelta(days=dias)).strftime("%Y-%m-%d")
        cant_pedidos=random.randint(0, 5) #cantidad de pedidos por dia
        for j in range(cant_pedidos):
            cliente_id = random.randint(1, 1000) #el margen sup es la cantidad de clientes que hay
            forma_pago = random.choice(formas_de_pago)

            if forma_pago == 'Efectivo' or forma_pago == 'Transferencia':
                cuotas ="1/1"
            else:
                cuotas_cant= random.choice(cuotas_posibles)
                cuotas_pagas = random.randint(1, cuotas_cant)
                cuotas = str(cuotas_pagas) + "/" + str(cuotas_cant)

            estado = random.choice(estados_de_envio)
            fecha_creacion = fecha
            fecha_modificacion = fecha

            #FOR PARA LINEA DE PRODUCTO
            cant_productos=random.randint(1, 6)
            total = 0
            for k in range(cant_productos):
                pedido_id = id_pedido
                producto_id = random.randint(1, 20) #el amrgen sup es la cantidad de productos que hay
                cantidad = random.randint(1, 5)
                # Iterar sobre la lista de productos para encontrar el precio correspondiente al ID deseado
                for producto in productos:
                    if producto[0] == producto_id:
                        precio_del_producto = producto[1]
                        break
                else:
                    print("No se encontró ningún producto con el ID {}".format(producto_id))
                    
                precio = precio_del_producto
                subtotal = cantidad * precio   

                data_ln.append((pedido_id, producto_id, cantidad, precio, subtotal))

                cursor_insert_ln.executemany('''
                    INSERT INTO linea_pedido(pedido_id, producto_id, cantidad, precio, subtotal)
                        VALUES (?, ?, ?, ?, ?)
                ''', data_ln)
                conn.commit()
                print(f"{k} Datos insertados en ln para el pedido {id_pedido}")
                total += subtotal

            id_pedido +=1
            
            data.append((cliente_id, forma_pago, cuotas, total, estado, fecha_creacion, fecha_modificacion))
        
        cursor_insert.executemany('''
            INSERT INTO pedidos(cliente_id, forma_pago, cuotas, total, estado, fecha_creacion, fecha_modificacion)
                VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', data)
        conn.commit()
        

        dias-=1

    
    print(f"{i*j} Datos insertados en pedido")
    

except sqlite3.Error as ex:
    print("Error durante las operaciones de la base de datos: {}".format(ex))
finally:
    cursor_select.close()
    cursor_insert.close()
    cursor_insert_ln.close()
    conn.close()




