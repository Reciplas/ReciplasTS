from django.urls import path

from django.conf.urls.static import static
from django.conf import settings
from . import views


app_name = "api"

urlpatterns = [
    # URLS CRUD CLIENTE
    path(
        "clientes/", views.ClienteView.as_view(), name="clientes_listar"
    ),  # Si la petición es get muestra todos los clientes
    path("clientes/<int:id>", views.ClienteView.as_view(), name="cliente"),
    # #URLS CRUD EMPLEADO
    path(
        "empleados/", views.EmpleadoView.as_view(), name="empleados_listar"
    ),  # Si la petición es get muestra todos los empleados
    path("empleados/<int:id>", views.EmpleadoView.as_view(), name="empleado"),
    # URLS CRUD PROVEEDOR
    path(
        "proveedores/", views.ProveedorView.as_view(), name="proveedores_listar"
    ),  # Si la petición es get muestra todos los proveedores
    path("proveedores/<int:id>", views.ProveedorView.as_view(), name="proveedor"),
    # URLS CRUD MATERIA PRIMA
    path(
        "materias_primas/",
        views.MateriaprimaView.as_view(),
        name="materias_primas_listar",
    ),  # Si la petición es get muestra todos las materias_primas
    path(
        "materias_primas/<int:id>",
        views.MateriaprimaView.as_view(),
        name="materia_prima",
    ),
    # URLS CRUD PRODUCTOS
    path(
        "productos/", views.ProductoView.as_view(), name="productos_listar"
    ),  # Si la petición es get muestra todos los productos
    path("productos/<int:id>", views.ProductoView.as_view(), name="productos"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
