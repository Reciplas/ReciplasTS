from django.urls import path

from django.conf.urls.static import static
from django.conf import settings
from . import views


app_name = "api"

urlpatterns = [
    
    path("clientes/", views.ClienteView.as_view(), name="clientes_listar"),   
    path("clientes/<int:id>", views.ClienteView.as_view(), name="cliente"),
    

    path("empleados/", views.EmpleadoView.as_view(), name="empleados_listar"),      
    path("empleados/<int:id>", views.EmpleadoView.as_view(), name="empleado"),
    

    path("proveedores/", views.ProveedorView.as_view(), name="proveedores_listar"),      
    path("proveedores/<int:id>", views.ProveedorView.as_view(), name="proveedor"),
    

    path("materias_primas/",views.MateriaPrimaView.as_view(), name="materias_primas_listar"),
    path("materias_primas/<int:id>", views.MateriaPrimaView.as_view(), name="materia_prima"),
    

    path("productos/", views.ProductoView.as_view(), name="productos_listar"),
    path("productos/<int:id>", views.ProductoView.as_view(), name="productos"),


    path("pedidos/", views.PedidoView.as_view(), name="pedidos_listar"),
    path("pedidos/<int:id>", views.PedidoView.as_view(), name="pedidos"),

    path("linea_pedidos/", views.LineaPedidoView.as_view(), name="linea_pedido_listar"),
    path("linea_pedidos/<int:pedido_id>", views.LineaPedidoView.as_view(), name="linea_pedido"),

    path("ventas/", views.VentaView.as_view(), name="ventas_listar"),
    path("ventas/<int:id>", views.VentaView.as_view(), name="ventas"),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
