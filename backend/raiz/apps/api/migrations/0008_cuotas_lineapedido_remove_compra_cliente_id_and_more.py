# Generated by Django 4.2.6 on 2023-11-12 20:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_pedido'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cuotas',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('observacion', models.CharField(blank=True, max_length=255, null=True)),
                ('total', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('estado', models.CharField(blank=True, default='Pendiente', max_length=50, null=True)),
                ('fecha_pago', models.DateField(blank=True, null=True)),
                ('fecha_vencimiento', models.DateField(blank=True, null=True)),
                ('fecha_creacion', models.DateField(auto_now_add=True, null=True)),
                ('fecha_modificacion', models.DateField(auto_now=True, null=True)),
            ],
            options={
                'db_table': 'cuotas',
            },
        ),
        migrations.CreateModel(
            name='LineaPedido',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.IntegerField(blank=True, null=True)),
                ('precio', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('subtotal', models.DecimalField(blank=True, decimal_places=2, max_digits=13, null=True)),
            ],
            options={
                'db_table': 'linea_pedido',
            },
        ),
        migrations.RemoveField(
            model_name='compra',
            name='cliente_id',
        ),
        migrations.DeleteModel(
            name='Venta',
        ),
        migrations.RenameField(
            model_name='pedido',
            old_name='cliente',
            new_name='observacion',
        ),
        migrations.RemoveField(
            model_name='registra',
            name='compra_id',
        ),
        migrations.AddField(
            model_name='pedido',
            name='cliente_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, to='api.cliente'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='pedido',
            name='forma_pago',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='registra',
            name='pedido_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, to='api.pedido'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='cliente',
            name='estado',
            field=models.CharField(blank=True, default='Activo', max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='cliente',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='empleado',
            name='estado',
            field=models.CharField(blank=True, default='Activo', max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='empleado',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='empleado',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='ingresos',
            name='estado',
            field=models.CharField(blank=True, default='Finalizado', max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='ingresos',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='ingresos',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='materiaprima',
            name='estado',
            field=models.CharField(blank=True, default='Activo', max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='materiaprima',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='materiaprima',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='pedido',
            name='estado',
            field=models.CharField(blank=True, default='Pendiente', max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='pedido',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='pedido',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='producto',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='producto',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='proveedor',
            name='fecha_creacion',
            field=models.DateField(auto_now_add=True, null=True),
        ),
        migrations.AlterField(
            model_name='proveedor',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AlterModelTable(
            name='cliente',
            table='clientes',
        ),
        migrations.AlterModelTable(
            name='empleado',
            table='empleados',
        ),
        migrations.AlterModelTable(
            name='pedido',
            table='pedidos',
        ),
        migrations.AlterModelTable(
            name='producto',
            table='productos',
        ),
        migrations.AlterModelTable(
            name='proveedor',
            table='proveedores',
        ),
        migrations.DeleteModel(
            name='Compra',
        ),
        migrations.AddField(
            model_name='lineapedido',
            name='pedido_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.pedido'),
        ),
        migrations.AddField(
            model_name='lineapedido',
            name='producto_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='api.producto'),
        ),
        migrations.AddField(
            model_name='cuotas',
            name='pedido_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='api.pedido'),
        ),
    ]
