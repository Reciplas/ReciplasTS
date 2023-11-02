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
        if (id > 0):
            clientes = list(Cliente.objects.filter(id=id).values())
            if len(clientes) > 0:
                cliente = clientes[0]
                datos = {'message': "Exito!", 'cliente': cliente}
            else:
                datos = {'message': "Cliente not found..."}
            return JsonResponse(datos)
        else:
            clientes = list(Cliente.objects.values())
            if len(clientes) > 0:
                datos = clientes
            else:
                datos = {'message': "clientes not found..."}
            return JsonResponse(datos, safe=False)
        


        
    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_cliente = Cliente(
                nombres=data.get('nombres', ''),
                apellido=data.get('apellido', ''),
                dni=data.get('dni', None),
                fec_nac=data.get('fec_nac', None),
                celular=data.get('celular', None),
                celular_alt=data.get('celular_alt', None),
                email=data.get('email', ''),
                direccion=data.get('direccion', ''),
                fecha_creacion=data.get('fecha_creacion', None),
                fecha_modificacion=data.get('fecha_modificacion', None),
                estado=data.get('estado', '')
            )
            nuevo_cliente.save()
            return JsonResponse({'message': 'Cliente creado con éxito'}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Error al analizar el cuerpo de la solicitud'}, status=400)
        
    # def post(self, request):
    #     # print(request.body)
    #     jd = json.loads(request.body)
    #     # print(jd)
    #     Cliente.objects.create(name=jd['name'], website=jd['website'], foundation=jd['foundation'])
    #     datos = {'message': "Exito!"}
    #     return JsonResponse(datos)

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            clientes = list(Cliente.objects.filter(id=id).values())
            if len(clientes) > 0:
                cliente = Cliente.objects.get(id=id)
                cliente.nombres = jd.get('nombres', cliente.nombres)
                cliente.apellido = jd.get('apellido', cliente.apellido)
                cliente.dni = jd.get('dni', cliente.dni)
                cliente.fec_nac = jd.get('fec_nac', cliente.fec_nac)
                cliente.celular = jd.get('celular', cliente.celular)
                cliente.celular_alt = jd.get('celular_alt', cliente.celular_alt)
                cliente.email = jd.get('email', cliente.email)
                cliente.direccion = jd.get('direccion', cliente.direccion)
                cliente.fecha_creacion = jd.get('fecha_creacion', cliente.fecha_creacion)
                cliente.fecha_modificacion = jd.get('fecha_modificacion', cliente.fecha_modificacion)
                cliente.estado = jd.get('estado', cliente.estado)
                cliente.save()
                datos = {'message': "Exito!"}
            else:
                datos = {'message': "Cliente not found..."}
        except json.JSONDecodeError as e:
            datos = {'error': 'Error al analizar el cuerpo de la solicitud', 'message': str(e)}
        return JsonResponse(datos)


    # def put(self, request, id):
    #     jd = json.loads(request.body)
    #     clientes = list(Cliente.objects.filter(id=id).values())
    #     if len(clientes) > 0:
    #         cliente = Cliente.objects.get(id=id)
    #         cliente.name = jd['name']
    #         cliente.website = jd['website']
    #         cliente.foundation = jd['foundation']
    #         cliente.save()
    #         datos = {'message': "Exito!"}
    #     else:
    #         datos = {'message': "Cliente not found..."}
    #     return JsonResponse(datos)

    def delete(self, request, id):
        try:
            clientes = list(Cliente.objects.filter(id=id).values())
            if len(clientes) > 0:
                Cliente.objects.filter(id=id).delete()
                datos = {'message': "Cliente eliminado con éxito"}
            else:
                datos = {'message': "Cliente no encontrado..."}
        except Exception as e:
            datos = {'error': 'Error al eliminar el cliente', 'message': str(e)}
        return JsonResponse(datos)

    # def delete(self, request, id):
    #     clientes = list(Cliente.objects.filter(id=id).values())
    #     if len(clientes) > 0:
    #         Cliente.objects.filter(id=id).delete()
    #         datos = {'message': "Exito!"}
    #     else:
    #         datos = {'message': "Cliente not found..."}
    #     return JsonResponse(datos)

# ___________________________________________________________________________________________
class ProveedorView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if (id > 0):
            proveedores = list(Proveedor.objects.filter(id=id).values())
            if len(proveedores) > 0:
                proveedor = proveedores[0]
                datos = {'message': "Exito!", 'proveedor': proveedor}
            else:
                datos = {'message': "proveedor not found..."}
            return JsonResponse(datos)
        else:
            proveedores = list(Proveedor.objects.values())
            if len(proveedores) > 0:
                datos = {'message': "Exito!", 'proveedores': proveedores}
            else:
                datos = {'message': "proveedores not found..."}
            return JsonResponse(datos)
        

    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_proveedor = Proveedor(
                razon_social=data.get('razon_social', ''),
                nombre_fantasia=data.get('nombre_fantasia', ''),
                cuit=data.get('cuit', None),
                celular=data.get('celular', None),
                celular_alt=data.get('celular_alt', None),
                email=data.get('email', ''),
                direccion=data.get('direccion', ''),
                fecha_creacion=data.get('fecha_creacion', None),
                fecha_modificacion=data.get('fecha_modificacion', None),
                estado=data.get('estado', '')
            )
            nuevo_proveedor.save()
            return JsonResponse({'message': 'Proveedor creado con éxito'}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Error al analizar el cuerpo de la solicitud'}, status=400)
        

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            proveedores = list(Proveedor.objects.filter(id=id).values())
            if len(proveedores) > 0:
                proveedor = Proveedor.objects.get(id=id)
                proveedor.razon_social = jd.get('razon_social', proveedor.razon_social)
                proveedor.nombre_fantasia = jd.get('nombre_fantasia', proveedor.nombre_fantasia)
                proveedor.cuit = jd.get('cuit', proveedor.cuit)
                proveedor.celular = jd.get('celular', proveedor.celular)
                proveedor.celular_alt = jd.get('celular', proveedor.celular_alt)
                proveedor.email = jd.get('email', proveedor.email)
                proveedor.direccion = jd.get('direccion', proveedor.direccion)
                proveedor.fecha_creacion = jd.get('fecha_creacion', proveedor.fecha_creacion)
                proveedor.fecha_modificacion = jd.get('fecha_modificacion', proveedor.fecha_modificacion)
                proveedor.estado = jd.get('estado', proveedor.estado)
                proveedor.save()
                datos = {'message': "Exito!"}
            else:
                datos = {'message': "Proveedor not found..."}
        except json.JSONDecodeError as e:
            datos = {'error': 'Error al analizar el cuerpo de la solicitud', 'message': str(e)}
        return JsonResponse(datos)


    def delete(self, request, id):
        try:
            proveedores = list(Proveedor.objects.filter(id=id).values())
            if len(proveedores) > 0:
                Proveedor.objects.filter(id=id).delete()
                datos = {'message': "Proveedor eliminado con éxito"}
            else:
                datos = {'message': "Proveedor no encontrado..."}
        except Exception as e:
            datos = {'error': 'Error al eliminar el proveedor', 'message': str(e)}
        return JsonResponse(datos)
    

# ___________________________________________________________________________________________
class EmpleadoView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if (id > 0):
            empleados = list(Empleado.objects.filter(id=id).values())
            if len(empleados) > 0:
                empleado = empleados[0]
                datos = {'message': "Exito!", 'empleado': empleado}
            else:
                datos = {'message': "empleado not found..."}
            return JsonResponse(datos)
        else:
            empleados = list(Empleado.objects.values())
            if len(empleados) > 0:
                datos = {'message': "Exito!", 'empleados': empleados}
            else:
                datos = {'message': "empleados not found..."}
            return JsonResponse(datos)
        

    def post(self, request):
        try:
            data = json.loads(request.body)
            nuevo_empleado = Empleado(
                nombres=data.get('nombres', ''),
                apellido=data.get('apellido', ''),
                dni=data.get('dni', None),
                fec_nac=data.get('fec_nac', None),
                celular=data.get('celular', None),
                celular_alt=data.get('celular_alt', None),
                email=data.get('email', ''),
                direccion=data.get('direccion', ''),
                salario=data.get('salario', None),
                area=data.get('area', ''),
                cargo=data.get('cargo', ''),
                desde=data.get('desde', None),
                hasta=data.get('hasta', None),
                fecha_creacion=data.get('fecha_creacion', None),
                fecha_modificacion=data.get('fecha_modificacion', None),
                estado=data.get('estado', '')
            )
            nuevo_empleado.save()
            return JsonResponse({'message': 'Empleado creado con éxito'}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Error al analizar el cuerpo de la solicitud'}, status=400)
        

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            empleados = list(Empleado.objects.filter(id=id).values())
            if len(empleados) > 0:
                empleado = Empleado.objects.get(id=id)
                empleado.nombres = jd.get('nombres', empleado.nombres)
                empleado.apellido = jd.get('apellido', empleado.apellido)
                empleado.dni = jd.get('dni', empleado.dni)
                empleado.fec_nac = jd.get('fec_nac', empleado.fec_nac)
                empleado.celular = jd.get('celular', empleado.celular)
                empleado.celular_alt = jd.get('celular', empleado.celular_alt)
                empleado.email = jd.get('email', empleado.email)
                empleado.direccion = jd.get('direccion', empleado.direccion)
                empleado.salario = jd.get('salario', empleado.salario)
                empleado.area = jd.get('area', empleado.area)
                empleado.cargo = jd.get('cargo', empleado.cargo)
                empleado.desde = jd.get('desde', empleado.desde)
                empleado.hasta = jd.get('hasta', empleado.hasta)
                empleado.fecha_creacion = jd.get('fecha_creacion', empleado.fecha_creacion)
                empleado.fecha_modificacion = jd.get('fecha_modificacion', empleado.fecha_modificacion)
                empleado.estado = jd.get('estado', empleado.estado)
                empleado.save()
                datos = {'message': "Exito!"}
            else:
                datos = {'message': "Empleado not found..."}
        except json.JSONDecodeError as e:
            datos = {'error': 'Error al analizar el cuerpo de la solicitud', 'message': str(e)}
        return JsonResponse(datos)


    def delete(self, request, id):
        try:
            empleados = list(Empleado.objects.filter(id=id).values())
            if len(empleados) > 0:
                Empleado.objects.filter(id=id).delete()
                datos = {'message': "Empleado eliminado con éxito"}
            else:
                datos = {'message': "Empleado no encontrado..."}
        except Exception as e:
            datos = {'error': 'Error al eliminar el Empleado', 'message': str(e)}
        return JsonResponse(datos)
    


# ___________________________________________________________________________________________
class MateriaprimaView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if (id > 0):
            materias_primas = list(Materiaprima.objects.filter(id=id).values())
            if len(materias_primas) > 0:
                materia_prima = materias_primas[0]
                datos = {'message': "Exito!", 'materia_prima': materia_prima}
            else:
                datos = {'message': "materia_prima not found..."}
            return JsonResponse(datos)
        else:
            materias_primas = list(Materiaprima.objects.values())
            if len(materias_primas) > 0:
                datos = {'message': "Exito!", 'materias_primas': materias_primas}
            else:
                datos = {'message': "materias primas not found..."}
            return JsonResponse(datos)
        

    def post(self, request):
        try:
            data = json.loads(request.body)
            nueva_materia_prima = Materiaprima(
                plastico=data.get('plastico', ''),
                descripcion=data.get('descripcion', ''),
                presentacion=data.get('presentacion', None),
                stock_act=data.get('stock_act', None),
                stock_inf=data.get('stock_inf', None),
                precio=data.get('precio', None),
                fecha_creacion=data.get('fecha_creacion', None),
                fecha_modificacion=data.get('fecha_modificacion', None),
                estado=data.get('estado', '')
            )
            nueva_materia_prima.save()
            return JsonResponse({'message': 'Materia prima creada con éxito'}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Error al analizar el cuerpo de la solicitud'}, status=400)
        

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            materias_primas = list(Materiaprima.objects.filter(id=id).values())
            if len(materias_primas) > 0:
                materia_prima = Materiaprima.objects.get(id=id)
                materia_prima.plastico = jd.get('plastico', materia_prima.plastico)
                materia_prima.descripcion = jd.get('descripcion', materia_prima.descripcion)
                materia_prima.presentacion = jd.get('presentacion', materia_prima.presentacion)
                materia_prima.stock_act = jd.get('stock_act', materia_prima.stock_act)
                materia_prima.stock_inf = jd.get('stock_inf', materia_prima.stock_inf)
                materia_prima.precio = jd.get('precio', materia_prima.precio)
                materia_prima.fecha_creacion = jd.get('fecha_creacion', materia_prima.fecha_creacion)
                materia_prima.fecha_modificacion = jd.get('fecha_modificacion', materia_prima.fecha_modificacion)
                materia_prima.estado = jd.get('estado', materia_prima.estado)
                materia_prima.save()
                datos = {'message': "Exito!"}
            else:
                datos = {'message': "Materia prima not found..."}
        except json.JSONDecodeError as e:
            datos = {'error': 'Error al analizar el cuerpo de la solicitud', 'message': str(e)}
        return JsonResponse(datos)


    def delete(self, request, id):
        try:
            materias_primas = list(Materiaprima.objects.filter(id=id).values())
            if len(materias_primas) > 0:
                Materiaprima.objects.filter(id=id).delete()
                datos = {'message': "Materia prima eliminada con éxito"}
            else:
                datos = {'message': "Materia prima no encontrada..."}
        except Exception as e:
            datos = {'error': 'Error al eliminar la Materia prima', 'message': str(e)}
        return JsonResponse(datos)
    
# ___________________________________________________________________________________________

class ProductoView(View):

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if (id > 0):
            productos = list(Producto.objects.filter(id=id).values())
            if len(productos) > 0:
                producto = productos[0]
                datos = {'message': "Exito!", 'producto': producto}
            else:
                datos = {'message': "producto not found..."}
            return JsonResponse(datos)
        else:
            productos = list(Producto.objects.values())
            if len(productos) > 0:
                datos = {'message': "Exito!", 'productos': productos}
            else:
                datos = {'message': "materias primas not found..."}
            return JsonResponse(datos)
        

    def post(self, request):
        try:
            data = json.loads(request.body)
            nueva_producto = Producto(
                nombre=data.get('nombre', ''),
                descripcion=data.get('descripcion', ''),
                presentacion=data.get('presentacion', ''),
                lote=data.get('lote', None),
                stock_act=data.get('stock_act', None),
                stock_inf=data.get('stock_inf', None),
                precio=data.get('precio', None),
                fecha_creacion=data.get('fecha_creacion', None),
                fecha_modificacion=data.get('fecha_modificacion', None),
                estado=data.get('estado', '')
            )
            nueva_producto.save()
            return JsonResponse({'message': 'Producto creada con éxito'}, status=201)
        except json.JSONDecodeError as e:
            return JsonResponse({'error': 'Error al analizar el cuerpo de la solicitud'}, status=400)
        

    def put(self, request, id):
        try:
            jd = json.loads(request.body)
            productos = list(Producto.objects.filter(id=id).values())
            if len(productos) > 0:
                producto = Producto.objects.get(id=id)
                producto.nombre = jd.get('nombre', producto.nombre)
                producto.descripcion = jd.get('descripcion', producto.descripcion)
                producto.presentacion = jd.get('presentacion', producto.presentacion)
                producto.lote = jd.get('lote', producto.lote)
                producto.stock_act = jd.get('stock_act', producto.stock_act)
                producto.stock_inf = jd.get('stock_inf', producto.stock_inf)
                producto.precio = jd.get('precio', producto.precio)
                producto.fecha_creacion = jd.get('fecha_creacion', producto.fecha_creacion)
                producto.fecha_modificacion = jd.get('fecha_modificacion', producto.fecha_modificacion)
                producto.estado = jd.get('estado', producto.estado)
                producto.save()
                datos = {'message': "Exito!"}
            else:
                datos = {'message': "Producto not found..."}
        except json.JSONDecodeError as e:
            datos = {'error': 'Error al analizar el cuerpo de la solicitud', 'message': str(e)}
        return JsonResponse(datos)


    def delete(self, request, id):
        try:
            productos = list(Producto.objects.filter(id=id).values())
            if len(productos) > 0:
                Producto.objects.filter(id=id).delete()
                datos = {'message': "Producto eliminado con éxito"}
            else:
                datos = {'message': "Producto no encontrad..."}
        except Exception as e:
            datos = {'error': 'Error al eliminar la Producto', 'message': str(e)}
        return JsonResponse(datos)