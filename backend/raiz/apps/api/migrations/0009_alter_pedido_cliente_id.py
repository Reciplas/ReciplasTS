# Generated by Django 4.2.6 on 2023-11-12 21:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_cuotas_lineapedido_remove_compra_cliente_id_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pedido',
            name='cliente_id',
            field=models.ForeignKey(db_column='cliente_id', on_delete=django.db.models.deletion.DO_NOTHING, to='api.cliente'),
        ),
    ]