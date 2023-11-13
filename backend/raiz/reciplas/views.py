from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required # Importación necesaria para usar el decorador
from django.contrib.auth import authenticate, login

from apps.usuarios.models import Usuario # Importación del nuevo formato que se le dio al usuario con forms


# def login_view(request):
#     if request.method == 'POST':
#         username = request.POST['username']
#         password = request.POST['password']
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             login(request,user)
#             # Usuario autenticado correctamente, redirigir a la vista correspondiente
#             # Luego redirijo  ala funcion mostrar_interfaz para que me meustre segun el area
#             return redirect('mostrar_interfaz')
#         else:
#             # Usuario no autenticado, podría mostrar mensaje de error porque no se encuentra en bdd
#             return render(request, 'error.html')
#     return render(request, 'usuarios/login.html')  # Renderizar la plantilla de inicio de sesión

# @login_required # solo lo hace si ya esta autentificado, esto se llama decorador 
# def mostrar_interfaz(request):
#     # Obtengo el usuario actualmente logueado
#     usuario = Usuario.objects.get(id=request.user.id)
#     # Obtengo el área del usuario
#     area = usuario.area
#     # Renderiza la interfaz adecuada en función del área
#     if area.nombre == 'Administracion':
#         return render(request, 'administracion.html')
#     elif area.nombre == 'Compras':
#         return render(request, 'compras.html')
#     elif area.nombre == 'Produccion':
#         return render(request, 'produccion.html')
#     elif area.nombre == 'Ventas':
#         return render(request, 'ventas.html')
#     else:
#         # Si no se encuentra el área, renderiza una página de error o redirecciona a una página predeterminada
#         return render(request, 'error.html')
    