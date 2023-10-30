from django.db import models
from django.contrib.auth.models import AbstractUser

class Area(models.Model):
    nombre = models.CharField(max_length=255, null=True)
    # Otros campo codigo por si tiene un ID el area o algo de eso
    codigo = models.CharField(max_length=10, unique=True, null=True)
    

    def __str__(self):
        return self.nombre

class Usuario(AbstractUser):
    # Agregar campos personalizados
    area = models.ForeignKey(Area, on_delete=models.CASCADE, null=True)
    fecha_nacimiento = models.DateField(null=True)
    direccion = models.CharField(max_length=255, null=True)
    telefono = models.CharField(max_length=20, null=True)
    # Otros campos personalizados que desees agregar

    # Métodos o funciones personalizadas
    def nombre_completo(self):
        return f'{self.first_name} {self.last_name}'

