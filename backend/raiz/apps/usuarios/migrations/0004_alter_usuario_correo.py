# Generated by Django 4.2 on 2023-04-13 02:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0003_usuario_correo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='correo',
            field=models.EmailField(max_length=254, null=True, unique=True),
        ),
    ]
