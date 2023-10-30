# Generated by Django 4.2 on 2023-04-12 17:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='area',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='usuarios.area'),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='direccion',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='fecha_nacimiento',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='telefono',
            field=models.CharField(max_length=20, null=True),
        ),
    ]
