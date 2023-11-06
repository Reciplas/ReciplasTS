# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cliente(models.Model):
    id                 = models.AutoField(primary_key=True)
    nombres            = models.CharField(max_length=80, blank=True, null=True)
    apellido           = models.CharField(max_length=60, blank=True, null=True)
    dni                = models.IntegerField(blank=True, null=True)
    fec_nac            = models.DateField(blank=True, null=True)
    celular            = models.IntegerField(blank=True, null=True)
    celular_alt        = models.IntegerField(blank=True, null=True)
    email              = models.CharField(max_length=60, blank=True, null=True)
    direccion          = models.CharField(max_length=150, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="True")

    class Meta:
        db_table = "cliente"


class Compra(models.Model):
    id                 = models.AutoField(primary_key=True)
    cliente_id         = models.ForeignKey(Cliente, models.DO_NOTHING)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    observacion        = models.CharField(max_length=255, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=50, blank=True, null=True, default="True")

    class Meta:
        db_table = "compra"


class Empleado(models.Model):
    id          = models.AutoField(primary_key=True)
    nombres     = models.CharField(max_length=80, blank=True, null=True)
    apellido    = models.CharField(max_length=60, blank=True, null=True)
    dni         = models.IntegerField(blank=True, null=True)
    fec_nac     = models.DateField(blank=True, null=True)
    celular     = models.IntegerField(blank=True, null=True)
    celular_alt = models.IntegerField(blank=True, null=True)
    email       = models.CharField(max_length=60, blank=True, null=True)
    direccion   = models.CharField(max_length=150, blank=True, null=True)
    salario     = models.DecimalField(
        max_digits=10, decimal_places=2, blank=True, null=True
    )
    area = models.CharField(max_length=255, blank=True, null=True)
    cargo              = models.CharField(max_length=100, blank=True, null=True)
    desde              = models.DateField(blank=True, null=True)
    hasta              = models.DateField(blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="True")

    class Meta:
        db_table = "empleado"


class Ingresan(models.Model):
    id               = models.AutoField(primary_key=True)
    ingreso_id       = models.ForeignKey(
        "Ingresos", models.DO_NOTHING
    )  # The composite primary key (ingreso_id, materia_prima_id) found, that is not supported. The first column is selected.
    materia_prima_id = models.ForeignKey("Materiaprima", models.DO_NOTHING)
    cantidad         = models.IntegerField(blank=True, null=True)
    precio           = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    descripcion      = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        db_table = "ingresan"


class Ingresos(models.Model):
    id                 = models.AutoField(primary_key=True)
    fecha              = models.DateField(blank=True, null=True)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=10, blank=True, null=True, default="True")

    class Meta:
        db_table = "ingresos"


# class Lineadetalle(models.Model):
#     id          = models.AutoField(primary_key=True)
#     pedido_id   = models.ForeignKey(
#         "Pedido", models.DO_NOTHING
#     )  # The composite primary key (pedido_id, producto_id) found, that is not supported. The first column is selected.
#     producto_id = models.ForeignKey("Producto", models.DO_NOTHING)
#     cantidad    = models.IntegerField(blank=True, null=True)
#     precio      = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)

#     class Meta:
#         db_table = "lineadetalle"


class Materiaprima(models.Model):
    id                 = models.AutoField(primary_key=True)
    plastico           = models.CharField(max_length=100, blank=True, null=True)
    descripcion        = models.CharField(max_length=150, blank=True, null=True)
    presentacion       = models.CharField(max_length=100, blank=True, null=True)
    stock_act          = models.IntegerField(blank=True, null=True)
    stock_inf          = models.IntegerField(blank=True, null=True)
    precio             = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="True")

    class Meta:
        db_table = "materia_prima"


class Pedido(models.Model):
    id                 = models.AutoField(primary_key=True)
    cliente            = models.CharField(max_length=255, blank=True, null=True)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    estado             = models.CharField(max_length=50, blank=True, null=True, default="True")
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)

    class Meta:
        db_table = "pedido"

class Venta(models.Model):
    id                 = models.AutoField(primary_key=True)
    cliente            = models.CharField(max_length=255, blank=True, null=True)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    cuotas             = models.CharField(max_length=255, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)

    class Meta:
        db_table = "venta"


class Producto(models.Model):
    id                 = models.AutoField(primary_key=True)
    nombre             = models.CharField(max_length=100, blank=True, null=True)
    descripcion        = models.CharField(max_length=150, blank=True, null=True)
    presentacion       = models.CharField(max_length=100, blank=True, null=True)
    lote               = models.IntegerField(blank=True, null=True)
    stock_act          = models.IntegerField(blank=True, null=True)
    stock_inf          = models.IntegerField(blank=True, null=True)
    precio             = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="True")

    class Meta:
        db_table = "producto"


# class Producen(models.Model):
#     id          = models.AutoField(primary_key=True)
#     empleado_id = models.ForeignKey(
#         Empleado, models.DO_NOTHING
#     )  # The composite primary key (empleado_id, producto_id) found, that is not supported. The first column is selected.
#     producto_id = models.ForeignKey(Pedido, models.DO_NOTHING)
#     cantidad    = models.IntegerField(blank=True, null=True)
#     precio      = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
#     descripcion = models.CharField(max_length=150, blank=True, null=True)

#     class Meta:
#         db_table = "producen"


class Proveedor(models.Model):
    id                 = models.AutoField(primary_key=True)
    razon_social       = models.CharField(max_length=255, blank=True, null=True)
    nombre_fantasia    = models.CharField(max_length=100, blank=True, null=True)
    cuit               = models.IntegerField(blank=True, null=True)
    celular            = models.IntegerField(blank=True, null=True)
    celular_alt        = models.IntegerField(blank=True, null=True)
    email              = models.CharField(max_length=60, blank=True, null=True)
    direccion          = models.CharField(max_length=150, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True)
    fecha_modificacion = models.DateField(blank=True, null=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="True")

    class Meta:
        db_table = "proveedor"


class Proveen(models.Model):
    id               = models.AutoField(primary_key=True)
    proveedor_id     = models.ForeignKey(
        Proveedor, models.DO_NOTHING
    )  # The composite primary key (proveedor_id, materia_prima_id) found, that is not supported. The first column is selected.
    materia_prima_id = models.ForeignKey(Materiaprima, models.DO_NOTHING)

    class Meta:
        db_table = "proveen"


class Registra(models.Model):
    id          = models.AutoField(primary_key=True)
    empleado_id = models.ForeignKey(
        Empleado, models.DO_NOTHING
    )  # The composite primary key (empleado_id, compra_id) found, that is not supported. The first column is selected.
    compra_id   = models.ForeignKey(Compra, models.DO_NOTHING)

    class Meta:
        db_table = "registra"
