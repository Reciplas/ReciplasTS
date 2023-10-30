from django import forms

from django.contrib.auth.forms import UserCreationForm
from .models import Usuario, Area
from apps.usuarios import models


#esto es para que se registren, tengo que ver porque tendran areas y no se pueden registrar solos
class RegistroForm(UserCreationForm):
    first_name = forms.CharField(label='Nombre', required=True)
    last_name = forms.CharField(label='Apellido', required=True)
    email = forms.EmailField(label='Correo', required=True)
    
    area = models.ForeignKey(Area, on_delete=models.CASCADE, null=True)
    fecha_nacimiento = models.DateField(null=True)
    direccion = models.CharField(max_length=255, null=True)
    telefono = models.CharField(max_length=20, null=True)
    password1 = forms.CharField(
        label='Contraseña', widget=forms.PasswordInput, required=True)
    password2 = forms.CharField(
        label='Confirmar Contraseña', widget=forms.PasswordInput, required=True)

    class Meta:
        model = Usuario
        fields = [
            'first_name',
            'last_name',
            'username',
            'email',
            'area',  # Agrega el campo 'area' a la lista de campos
            'fecha_nacimiento',  # Agrega el campo 'fecha_nacimiento' a la lista de campos
            'direccion',  # Agrega el campo 'direccion' a la lista de campos
            'telefono',  # Agrega el campo 'telefono' a la lista de campos
            'password1',
            'password2'
        ]

"""agregado para la busqueda del usuario """

class InicioSesionForm(forms.Form):
    usuario = forms.CharField(max_length=150)
    contrasena = forms.CharField(widget=forms.PasswordInput())
