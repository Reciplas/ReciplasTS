# Generated by Django 4.2 on 2023-04-13 01:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0002_alter_usuario_area_alter_usuario_direccion_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='correo',
            field=models.EmailField(default='noemail@example.com', max_length=254, unique=True),
        ),
    ]
