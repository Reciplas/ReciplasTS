# Generated by Django 4.2.6 on 2023-11-14 18:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0012_alter_producto_estado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='lineapedido',
            name='pedido_id',
            field=models.ForeignKey(db_column='pedido_id', on_delete=django.db.models.deletion.CASCADE, to='api.pedido'),
        ),
        migrations.AlterField(
            model_name='lineapedido',
            name='producto_id',
            field=models.ForeignKey(db_column='producto_id', on_delete=django.db.models.deletion.DO_NOTHING, to='api.producto'),
        ),
    ]
