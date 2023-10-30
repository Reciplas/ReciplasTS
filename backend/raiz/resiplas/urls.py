
from django.contrib import admin
from django.urls import path, include

from django.conf.urls.static import static  #para que se vean las imaganes
from django.conf import settings 

from django.contrib.auth import views as auth

from .import views # Importación de todas las views

urlpatterns = [
    #URL del sitio de administration de Django
    path('admin/', admin.site.urls),

    #URL de home/login
    # path('',auth.LoginView.as_view(template_name='usuarios/login.html'),name= 'login'),

    path('api/',include('apps.api.urls')),

    # #URL Verificacion del usuario
    # path('iniciar/', views.login_view),

    # #URL a vista de interfaces segun Área
    # path('mostrar_interfaz/', views.mostrar_interfaz, name='mostrar_interfaz'),

    # #URL logout
    path('logout/',auth.LogoutView.as_view(),name= 'logout'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) # Esto es para que muestre lo estatico

