# Create your views here.
from django.http.response import JsonResponse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from .models import *
import json


class ClienteView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                cliente = Cliente.objects.get(id=id)
                datos = {
                    "ID": cliente.id,
                    "nombres": cliente.nombres,
                    "apellidos": cliente.apellidos,
                    "DNI": cliente.dni,
                    "fecha de nacimiento": cliente.fec_nac,
                    "celular": cliente.celular,
                    "celular alt": cliente.celular_alt,
                    "email": cliente.email,
                    "dirección": cliente.direccion,
                    "estado": cliente.estado,
                    "fecha creación": cliente.fecha_creacion,
                    "fecha modificación": cliente.fecha_creacion
                }
            except Cliente.DoesNotExist:
                datos = {"message": "Cliente not found..."}
            return JsonResponse(datos, safe=False)
        else:
            clientes = Cliente.objects.all()
            if clientes:
                datos = [{
                    "ID": cliente.id,
                    "nombres": cliente.nombres,
                    "apellidos": cliente.apellidos,
                    "DNI": cliente.dni,
                    "fecha de nacimiento": cliente.fec_nac,
                    "celular": cliente.celular,
                    "celular alt": cliente.celular_alt,
                    "email": cliente.email,
                    "dirección": cliente.direccion,
                    "estado": cliente.estado,
                    "fecha creación": cliente.fecha_creacion,
                    "fecha modificación": cliente.fecha_creacion
                    } for cliente in clientes]
            else:
                datos = {"message": "clientes not found..."}
            return JsonResponse(datos, safe=False)

    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_cliente = Cliente(
                nombres=data.get("nombres", ""),
                apellido=data.get("apellido", ""),
                dni=data.get("dni", None),
                fec_nac=data.get("fec_nac", None),
                celular=data.get("celular", None),
                celular_alt=data.get("celular_alt", None),
                email=data.get("email", ""),
                direccion=data.get("direccion", ""),
                estado=data.get("estado", ""),
            )
            nuevo_cliente.save()
            return JsonResponse({"message": "Cliente creado con éxito"}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )


    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            clientes = list(Cliente.objects.filter(id=id).values())
            if len(clientes) > 0:
                cliente = Cliente.objects.get(id=id)
                cliente.nombres = jd.get("nombres", cliente.nombres)
                cliente.apellido = jd.get("apellido", cliente.apellido)
                cliente.dni = jd.get("dni", cliente.dni)
                cliente.fec_nac = jd.get("fec_nac", cliente.fec_nac)
                cliente.celular = jd.get("celular", cliente.celular)
                cliente.celular_alt = jd.get(
                    "celular_alt", cliente.celular_alt)
                cliente.email = jd.get("email", cliente.email)
                cliente.direccion = jd.get("direccion", cliente.direccion)
                cliente.estado = jd.get("estado", cliente.estado)
                cliente.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Cliente not found..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            clientes = list(Cliente.objects.filter(id=id).values())
            if len(clientes) > 0:
                Cliente.objects.filter(id=id).delete()
                datos = {"message": "Cliente eliminado con éxito"}
            else:
                datos = {"message": "Cliente no encontrado..."}
        except Exception as e:
            datos = {"error": "Error al eliminar el cliente",
                     "message": str(e)}
        return JsonResponse(datos)




# ___________________________________________________________________________________________
class ProveedorView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                proveedor = Proveedor.objects.get(id=id)
                datos = {
                    "ID": proveedor.id,
                    "razón social": proveedor.razon_social,
                    "nombre de fantasía": proveedor.nombre_fantasia,
                    "CUIT": proveedor.cuit,
                    "celular": proveedor.celular,
                    "celular alt": proveedor.celular_alt,
                    "email": proveedor.email,
                    "dirección": proveedor.direccion,
                    "estado": proveedor.estado,
                    "fecha creación": proveedor.fecha_creacion,
                    "fecha modificación": proveedor.fecha_creacion
                }
            except Proveedor.DoesNotExist:
                datos = {"message": "Proveedor not found..."}
            return JsonResponse(datos, safe=False)
        else:
            proveedores = Proveedor.objects.all()
            if proveedores:
               datos = [{
                    "ID": proveedor.id,
                    "razón social": proveedor.razon_social,
                    "nombre de fantasía": proveedor.nombre_fantasia,
                    "CUIT": proveedor.cuit,
                    "celular": proveedor.celular,
                    "celular alt": proveedor.celular_alt,
                    "email": proveedor.email,
                    "dirección": proveedor.direccion,
                    "estado": proveedor.estado,
                    "fecha creación": proveedor.fecha_creacion,
                    "fecha modificación": proveedor.fecha_creacion
                } for proveedor in proveedores]
            else:
                datos = {"message": "proveedores not found..."}
            return JsonResponse(datos, safe=False)
        



    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_proveedor = Proveedor(
                razon_social=data.get("razon_social", ""),
                nombre_fantasia=data.get("nombre_fantasia", ""),
                cuit=data.get("cuit", None),
                celular=data.get("celular", None),
                celular_alt=data.get("celular_alt", None),
                email=data.get("email", ""),
                direccion=data.get("direccion", ""),
                estado=data.get("estado", ""),
            )
            nuevo_proveedor.save()
            return JsonResponse({"message": "Proveedor creado con éxito"}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            proveedores = list(Proveedor.objects.filter(id=id).values())
            if len(proveedores) > 0:
                proveedor = Proveedor.objects.get(id=id)
                proveedor.razon_social = jd.get(
                    "razon_social", proveedor.razon_social)
                proveedor.nombre_fantasia = jd.get(
                    "nombre_fantasia", proveedor.nombre_fantasia
                )
                proveedor.cuit = jd.get("cuit", proveedor.cuit)
                proveedor.celular = jd.get("celular", proveedor.celular)
                proveedor.celular_alt = jd.get(
                    "celular", proveedor.celular_alt)
                proveedor.email = jd.get("email", proveedor.email)
                proveedor.direccion = jd.get("direccion", proveedor.direccion)
                proveedor.estado = jd.get("estado", proveedor.estado)
                proveedor.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Proveedor not found..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            proveedores = list(Proveedor.objects.filter(id=id).values())
            if len(proveedores) > 0:
                Proveedor.objects.filter(id=id).delete()
                datos = {"message": "Proveedor eliminado con éxito"}
            else:
                datos = {"message": "Proveedor no encontrado..."}
        except Exception as e:
            datos = {"error": "Error al eliminar el proveedor",
                     "message": str(e)}
        return JsonResponse(datos)


# ___________________________________________________________________________________________
class EmpleadoView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                empleado = Empleado.objects.get(id=id)
                datos = {
                    "ID": empleado.id,
                    "nombres": empleado.nombres,
                    "apellidos": empleado.apellidos,
                    "DNI": empleado.dni,
                    "fecha de nacimiento": empleado.fec_nac,
                    "celular": empleado.celular,
                    "celular alt": empleado.celular_alt,
                    "email": empleado.email,
                    "dirección": empleado.direccion,
                    "salario": empleado.salario,
                    "área": empleado.area,
                    "cargo": empleado.cargo,
                    "salario": empleado.salario,
                    "desde": empleado.desde,
                    "hasta": empleado.hasta,
                    "estado": empleado.estado,
                    "fecha creación": empleado.fecha_creacion,
                    "fecha modificación": empleado.fecha_creacion
                }
            except Empleado.DoesNotExist:
                datos = {"message": "Empleado not found..."}
            return JsonResponse(datos, safe=False)
        else:
            empleados = Empleado.objects.all()
            if empleados:
                datos = [{
                    "ID": empleado.id,
                    "nombres": empleado.nombres,
                    "apellidos": empleado.apellidos,
                    "DNI": empleado.dni,
                    "fecha de nacimiento": empleado.fec_nac,
                    "celular": empleado.celular,
                    "celular alt": empleado.celular_alt,
                    "email": empleado.email,
                    "dirección": empleado.direccion,
                    "salario": empleado.salario,
                    "área": empleado.area,
                    "cargo": empleado.cargo,
                    "salario": empleado.salario,
                    "desde": empleado.desde,
                    "hasta": empleado.hasta,
                    "estado": empleado.estado,
                    "fecha creación": empleado.fecha_creacion,
                    "fecha modificación": empleado.fecha_creacion
                } for empleado in empleados]
            else:
                datos = {"message": "empleados not found..."}
            return JsonResponse(datos, safe=False)

    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_empleado = Empleado(
                nombres=data.get("nombres", ""),
                apellido=data.get("apellido", ""),
                dni=data.get("dni", None),
                fec_nac=data.get("fec_nac", None),
                celular=data.get("celular", None),
                celular_alt=data.get("celular_alt", None),
                email=data.get("email", ""),
                direccion=data.get("direccion", ""),
                salario=data.get("salario", None),
                area=data.get("area", ""),
                cargo=data.get("cargo", ""),
                desde=data.get("desde", None),
                hasta=data.get("hasta", None),
                estado=data.get("estado", ""),
            )
            nuevo_empleado.save()
            return JsonResponse({"message": "Empleado creado con éxito"}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            empleados = list(Empleado.objects.filter(id=id).values())
            if len(empleados) > 0:
                empleado = Empleado.objects.get(id=id)
                empleado.nombres = jd.get("nombres", empleado.nombres)
                empleado.apellido = jd.get("apellido", empleado.apellido)
                empleado.dni = jd.get("dni", empleado.dni)
                empleado.fec_nac = jd.get("fec_nac", empleado.fec_nac)
                empleado.celular = jd.get("celular", empleado.celular)
                empleado.celular_alt = jd.get("celular", empleado.celular_alt)
                empleado.email = jd.get("email", empleado.email)
                empleado.direccion = jd.get("direccion", empleado.direccion)
                empleado.salario = jd.get("salario", empleado.salario)
                empleado.area = jd.get("area", empleado.area)
                empleado.cargo = jd.get("cargo", empleado.cargo)
                empleado.desde = jd.get("desde", empleado.desde)
                empleado.hasta = jd.get("hasta", empleado.hasta)
                empleado.estado = jd.get("estado", empleado.estado)
                empleado.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Empleado not found..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            empleados = list(Empleado.objects.filter(id=id).values())
            if len(empleados) > 0:
                Empleado.objects.filter(id=id).delete()
                datos = {"message": "Empleado eliminado con éxito"}
            else:
                datos = {"message": "Empleado no encontrado..."}
        except Exception as e:
            datos = {"error": "Error al eliminar el Empleado",
                     "message": str(e)}
        return JsonResponse(datos)


# ___________________________________________________________________________________________
class MateriaPrimaView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                materia_prima = MateriaPrima.objects.get(id=id)
                datos = {
                    "ID": materia_prima.id,
                    "plástico": materia_prima.plastico,
                    "descripción": materia_prima.descripcion,
                    "presentación": materia_prima.presentacion,
                    "stock actual": materia_prima.stock_act,
                    "stock inferior": materia_prima.stock_inf,
                    "precio": materia_prima.precio,
                    "estado": materia_prima.estado,
                    "fecha creación": materia_prima.fecha_creacion,
                    "fecha modificación": materia_prima.fecha_creacion
                }
            except MateriaPrima.DoesNotExist:
                datos = {"message": "Materia Prima not found..."}
            return JsonResponse(datos, safe=False)
        else:
            materias_primas = MateriaPrima.objects.all()
            if materias_primas:
                datos = [{
                    "ID": materia_prima.id,
                    "plástico": materia_prima.plastico,
                    "descripción": materia_prima.descripcion,
                    "presentación": materia_prima.presentacion,
                    "stock actual": materia_prima.stock_act,
                    "stock inferior": materia_prima.stock_inf,
                    "precio": materia_prima.precio,
                    "estado": materia_prima.estado,
                    "fecha creación": materia_prima.fecha_creacion,
                    "fecha modificación": materia_prima.fecha_creacion
                } for materia_prima in materias_primas]
            else:
                datos = {"message": "Materia Prima not found..."}
            return JsonResponse(datos, safe=False)


    def post(self, request):
        try:
            data = json.loads(request.body)
            nueva_materia_prima = MateriaPrima(
                plastico=data.get("plastico", ""),
                descripcion=data.get("descripcion", ""),
                presentacion=data.get("presentacion", None),
                stock_act=data.get("stock_act", None),
                stock_inf=data.get("stock_inf", None),
                precio=data.get("precio", None),
                estado=data.get("estado", ""),
            )
            nueva_materia_prima.save()
            return JsonResponse(
                {"message": "Materia prima creada con éxito"}, status=201
            )
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            materias_primas = list(MateriaPrima.objects.filter(id=id).values())
            if len(materias_primas) > 0:
                materia_prima = MateriaPrima.objects.get(id=id)
                materia_prima.plastico = jd.get(
                    "plastico", materia_prima.plastico)
                materia_prima.descripcion = jd.get(
                    "descripcion", materia_prima.descripcion)
                materia_prima.presentacion = jd.get(
                    "presentacion", materia_prima.presentacion)
                materia_prima.stock_act = jd.get(
                    "stock_act", materia_prima.stock_act)
                materia_prima.stock_inf = jd.get(
                    "stock_inf", materia_prima.stock_inf)
                materia_prima.precio = jd.get("precio", materia_prima.precio)
                materia_prima.estado = jd.get("estado", materia_prima.estado)
                materia_prima.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Materia prima not found..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            materias_primas = list(MateriaPrima.objects.filter(id=id).values())
            if len(materias_primas) > 0:
                MateriaPrima.objects.filter(id=id).delete()
                datos = {"message": "Materia prima eliminada con éxito"}
            else:
                datos = {"message": "Materia prima no encontrada..."}
        except Exception as e:
            datos = {"error": "Error al eliminar la Materia prima",
                     "message": str(e)}
        return JsonResponse(datos)


# ___________________________________________________________________________________________


class ProductoView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                producto = Producto.objects.get(id=id)
                datos = {
                    "ID": producto.id,
                    "nombre": producto.nombre,
                    "descripción": producto.descripcion,
                    "presentación": producto.presentacion,
                    "lote": producto.lote,
                    "stock actual": producto.stock_act,
                    "stock inferior": producto.stock_inf,
                    "precio": producto.precio,
                    "estado": producto.estado,
                    "fecha creación": producto.fecha_creacion,
                    "fecha modificación": producto.fecha_creacion
                }
            except Producto.DoesNotExist:
                datos = {"message": "Producto not found..."}
            return JsonResponse(datos, safe=False)
        else:
            productos = Producto.objects.all()
            if productos:
                datos = [{
                    "ID": producto.id,
                    "nombre": producto.nombre,
                    "descripción": producto.descripcion,
                    "presentación": producto.presentacion,
                    "lote": producto.lote,
                    "stock actual": producto.stock_act,
                    "stock inferior": producto.stock_inf,
                    "precio": producto.precio,
                    "estado": producto.estado,
                    "fecha creación": producto.fecha_creacion,
                    "fecha modificación": producto.fecha_creacion
                } for producto in productos]
            else:
                datos = {"message": "Productos not found..."}
            return JsonResponse(datos, safe=False)


    def post(self, request):
        try:
            data = json.loads(request.body)
            nueva_producto = Producto(
                nombre=data.get("nombre", ""),
                descripcion=data.get("descripcion", ""),
                presentacion=data.get("presentacion", ""),
                lote=data.get("lote", None),
                stock_act=data.get("stock_act", None),
                stock_inf=data.get("stock_inf", None),
                precio=data.get("precio", None),
                estado=data.get("estado", ""),
            )
            nueva_producto.save()
            return JsonResponse({"message": "Producto creada con éxito"}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            productos = list(Producto.objects.filter(id=id).values())
            if len(productos) > 0:
                producto = Producto.objects.get(id=id)
                producto.nombre = jd.get("nombre", producto.nombre)
                producto.descripcion = jd.get(
                    "descripcion", producto.descripcion)
                producto.presentacion = jd.get(
                    "presentacion", producto.presentacion)
                producto.lote = jd.get("lote", producto.lote)
                producto.stock_act = jd.get("stock_act", producto.stock_act)
                producto.stock_inf = jd.get("stock_inf", producto.stock_inf)
                producto.precio = jd.get("precio", producto.precio)
                producto.estado = jd.get("estado", producto.estado)
                producto.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Producto no encontrado..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            productos = list(Producto.objects.filter(id=id).values())
            if len(productos) > 0:
                Producto.objects.filter(id=id).delete()
                datos = {"message": "Producto eliminado con éxito"}
            else:
                datos = {"message": "Producto no encontrado..."}
        except Exception as e:
            datos = {"error": "Error al eliminar el Producto",
                     "message": str(e)}
        return JsonResponse(datos)

# ___________________________________________________________________________________________


class PedidoView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            try:
                # Uso select_related para traer los datos relacionados del cliente, y que no muestre su ID.
                pedido = Pedido.objects.select_related(
                'cliente_id').filter(id=id).first()
                datos = {
                    "ID": pedido.id,
                    "apellidos": pedido.cliente_id.apellidos,
                    "nombres": pedido.cliente_id.nombres,
                    "forma de pago": pedido.forma_pago,
                    "observación": pedido.observacion,
                    "total": pedido.total,
                    "estado": pedido.estado,
                    "fecha creación": pedido.fecha_creacion,
                    "fecha modificación": pedido.fecha_creacion
                    }
            except Pedido.DoesNotExist:
                datos = {"message": "Pedido not found..."}
            return JsonResponse(datos, safe=False)
            
        else:
            pedidos = Pedido.objects.select_related('cliente_id').all()
            if pedidos:
                # Accede al nombre del cliente a través de la relación
                datos = [{
                    "ID": pedido.id,
                    "apellidos": pedido.cliente_id.apellidos,
                    "nombres": pedido.cliente_id.nombres,
                    "forma de pago": pedido.forma_pago,
                    "observación": pedido.observacion,
                    "total": pedido.total,
                    "estado": pedido.estado,
                    "fecha creación": pedido.fecha_creacion,
                    "fecha modificación": pedido.fecha_creacion
                    } for pedido in pedidos]
            else:
                datos = {"message": "Pedidos no encontrados..."}
            return JsonResponse(datos, safe=False)

    def post(self, request):
        try:
            data = json.loads(request.body)
            nueva_pedido = Pedido(
                # empleado_id         = data.get("empleado_id", ""),
                # compra_id           = data.get("compra_id", ""),
                cliente=data.get("cliente", ""),
                total=data.get("total", ""),
                estado=data.get("estado", ""),
            )
            nueva_pedido.save()
            return JsonResponse({"message": "Pedido creado con éxito"}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse(
                {"error": "Error al analizar el cuerpo de la solicitud"}, status=400
            )

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            pedidos = list(Pedido.objects.filter(id=id).values())
            if len(pedidos) > 0:
                pedido = Pedido.objects.get(id=id)
                pedido.estado = jd.get("estado", pedido.estado)
                pedido.save()
                datos = {"message": "Exito!"}
            else:
                datos = {"message": "Pedido not found..."}
        except json.JSONDecodeError as e:
            datos = {
                "error": "Error al analizar el cuerpo de la solicitud",
                "message": str(e),
            }
        return JsonResponse(datos)

    def delete(self, request, id):
        try:
            pedidos = list(Pedido.objects.filter(id=id).values())
            if len(pedidos) > 0:
                Pedido.objects.filter(id=id).delete()
                datos = {"message": "Pedido eliminado con éxito"}
            else:
                datos = {"message": "Pedido no encontrado..."}
        except Exception as e:
            datos = {"error": "Error al eliminar el Pedido", "message": str(e)}
        return JsonResponse(datos)
# ___________________________________________________________________________________________

# Un pedido en estado "Finalziado" es una venta
class VentaView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            # Uso select_related para traer los datos relacionados del cliente, y que no muestre su ID.
            pedido = Pedido.objects.select_related(
                'cliente_id').filter(id=id).first()
            if pedido:
                # Accede al nombre del cliente a través de la relación
                datos = {
                    "ID": pedido.id,
                    "apellidos": pedido.cliente_id.apellidos,
                    "nombres": pedido.cliente_id.nombres,
                    "forma de pago": pedido.forma_pago,
                    "observación": pedido.observacion,
                    "total": pedido.total,
                    "estado": pedido.estado,
                    "fecha creación": pedido.fecha_creacion,
                    "fecha modificación": pedido.fecha_creacion
                    }
            else:
                datos = {"message": "Pedido no encontrado..."}
            return JsonResponse(datos)
        else:
            # Utiliza select_related para traer los datos relacionados del cliente
            pedidos = Pedido.objects.select_related(
                'cliente_id').filter(estado='Finalizado')

            if pedidos:
                # Accede al nombre del cliente a través de la relación
                datos = [{
                    "ID": pedido.id,
                    "apellidos": pedido.cliente_id.apellidos,
                    "nombres": pedido.cliente_id.nombres,
                    "forma de pago": pedido.forma_pago,
                    "observación": pedido.observacion,
                    "total": pedido.total,
                    "estado": pedido.estado,
                    "fecha creación": pedido.fecha_creacion,
                    "fecha modificación": pedido.fecha_creacion
                    } for pedido in pedidos]
            else:
                datos = {"message": "Pedidos no encontrados..."}
            return JsonResponse(datos, safe=False)
