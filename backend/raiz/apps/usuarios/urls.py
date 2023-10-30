
from django.urls import path
from .import views 
from django.contrib.auth import views as auth
#
app_name= 'usuarios'

urlpatterns = [
    #URL especifica para el registro de un nuevo usuario
    path('registro/', views.Registro.as_view(), name= 'Registro'),
]