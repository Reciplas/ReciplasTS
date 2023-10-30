from django.http import HttpResponse
from django.views.generic import View
from django.shortcuts import render
from django.views.generic import CreateView
from django.urls import reverse_lazy
from .models import Usuario
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login

#agregado para manejar el inicio de sesion el InicioSesionForm
from .forms import RegistroForm, InicioSesionForm




class RegistroForm(CreateView):
    #formulario django 
    form_class = RegistroForm
    success_url = reverse_lazy('login')
    template_name = 'usuarios/registrarse.html'


"""NO UTILICE ESTO, LO HICE DIRECTAMENTE EN LA VISTA PRINCIPAL
def procesar_inicio_sesion(request):
    if request.method == 'POST':
        form = InicioSesionForm(request.POST)
        if form.is_valid():
            usuario = form.cleaned_data['usuario'] # Corregido: obtener el valor del campo 'usuario' en lugar de 'correo'
            contrasena = form.cleaned_data['contrasena']
            
            # Realizar la búsqueda en la base de datos y realizar acciones adicionales según corresponda
            # Por ejemplo:
            usuarioBDD = Usuario.objects.filter(username=usuario, password=contrasena).first() # Corregido: utilizar los nombres de los campos del modelo Usuario
            if usuarioBDD:
                # Usuario válido, realizar acciones de inicio de sesión exitoso
                return HttpResponse('Inicio de sesión exitoso')
            else:
                # Usuario no válido, realizar acciones de inicio de sesión fallido
                return HttpResponse('Inicio de sesión fallido')
    else:
        form = InicioSesionForm()
    return render(request, 'login.html', {'form': form})


def mostrar_interfaz(request):
    # Obtengo el usuario actualmente logueado
    usuario = Usuario.objects.get(id=request.user.id)


    # Obtén el área del usuario
    area = usuario.area
    # Renderiza la interfaz adecuada en función del área
    if area.nombre == 'Area1':
        return render(request, 'login.html')
    elif area.nombre == 'Area2':
        return render(request, 'indexCompra.html')
    else:
        # Si no se encuentra el área, renderiza una página de error o redirecciona a una página predeterminada
        return render(request, 'error.html')
    



#def login(request):
#    return render(request,'usuarios/login.html')
"""