# Generated by Django 4.2.7 on 2023-11-06 16:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("api", "0002_remove_pedido_observacion_pedido_cliente_and_more"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="pedido",
            name="compra_id",
        ),
        migrations.RemoveField(
            model_name="pedido",
            name="empleado_id",
        ),
    ]
