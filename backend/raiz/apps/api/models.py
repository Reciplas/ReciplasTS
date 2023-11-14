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
    apellidos           = models.CharField(max_length=60, blank=True, null=True)
    dni                = models.IntegerField(blank=True, null=True)
    fec_nac            = models.DateField(blank=True, null=True)
    celular            = models.IntegerField(blank=True, null=True)
    celular_alt        = models.IntegerField(blank=True, null=True)
    email              = models.CharField(max_length=60, blank=True, null=True)
    direccion          = models.CharField(max_length=150, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="Activo")

    class Meta:
        db_table = "clientes"

    def __str__(self):
        return self.apellidos + ' ' + self.nombres

class Empleado(models.Model):
    id          = models.AutoField(primary_key=True)
    nombres     = models.CharField(max_length=80, blank=True, null=True)
    apellidos    = models.CharField(max_length=60, blank=True, null=True)
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
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="Activo")

    class Meta:
        db_table = "empleados"

    def __str__(self):
        return self.apellidos + ' ' + self.nombres


class Ingresan(models.Model):
    id               = models.AutoField(primary_key=True)
    ingreso_id       = models.ForeignKey(
        "Ingresos", models.DO_NOTHING
    )  
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
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=10, blank=True, null=True, default="Finalizado")

    class Meta:
        db_table = "ingresos"


class LineaPedido(models.Model):
    id          = models.AutoField(primary_key=True)
    pedido_id   = models.ForeignKey(
        "Pedido", models.CASCADE, db_column='pedido_id'
    )  
    producto_id = models.ForeignKey("Producto", models.DO_NOTHING, db_column='producto_id')
    cantidad    = models.IntegerField(blank=True, null=True)
    precio      = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    subtotal    = models.DecimalField(max_digits=13, decimal_places=2, blank=True, null=True)

    class Meta:
        db_table = "linea_pedido"


class MateriaPrima(models.Model):
    id                 = models.AutoField(primary_key=True)
    plastico           = models.CharField(max_length=100, blank=True, null=True)
    descripcion        = models.CharField(max_length=150, blank=True, null=True)
    presentacion       = models.CharField(max_length=100, blank=True, null=True)
    stock_act          = models.IntegerField(blank=True, null=True)
    stock_inf          = models.IntegerField(blank=True, null=True)
    precio             = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="Activo")

    class Meta:
        db_table = "materia_prima"
        

#En la reunión de Discord se llego al acuerdo de que el mismo pedido, al estar en el estado entregado, pasa a ser la "Venta". Esto porque basicamente tienen los mismos atributos, y se puede filtrar por su estado simplemente.
class Pedido(models.Model):
    id                 = models.AutoField(primary_key=True)
    cliente_id         = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='cliente_id')
    forma_pago         = models.CharField(max_length=20, blank=True, null=True)
    observacion        = models.CharField(max_length=255, blank=True, null=True)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    estado             = models.CharField(max_length=50, blank=True, null=True, default="Pendiente")
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)

    class Meta:
        db_table = "pedidos"


#quedamos en que si el pago es en efectivo o transferencia de todas formas se genera una cuota. que despues se ve como 1/1
class Cuotas(models.Model):
    id                 = models.AutoField(primary_key=True)
    pedido_id          = models.ForeignKey(Pedido, models.DO_NOTHING)
    observacion        = models.CharField(max_length=255, blank=True, null=True)
    total              = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    estado             = models.CharField(max_length=50, blank=True, null=True, default="Pendiente")
    fecha_pago         = models.DateField(blank=True, null=True)
    fecha_vencimiento  = models.DateField(blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)

    class Meta:
        db_table = "cuotas"
    


class Producto(models.Model):
    id                 = models.AutoField(primary_key=True)
    nombre             = models.CharField(max_length=100, blank=True, null=True)
    descripcion        = models.CharField(max_length=150, blank=True, null=True)
    presentacion       = models.CharField(max_length=100, blank=True, null=True)
    lote               = models.IntegerField(blank=True, null=True)
    stock_act          = models.IntegerField(blank=True, null=True)
    stock_inf          = models.IntegerField(blank=True, null=True)
    precio             = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="Activo")

    class Meta:
        db_table = "productos"

    def __str__(self):
        return self.nombre

    


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
    fecha_creacion     = models.DateField(blank=True, null=True, auto_now_add=True)
    fecha_modificacion = models.DateField(blank=True, null=True, auto_now=True)
    estado             = models.CharField(max_length=20, blank=True, null=True, default="Activo")

    class Meta:
        db_table = "proveedores"

    def __str__(self):
        return self.razon_social

    

class Proveen(models.Model):
    id               = models.AutoField(primary_key=True)
    proveedor_id     = models.ForeignKey(
        Proveedor, models.DO_NOTHING
    )  
    materia_prima_id = models.ForeignKey(MateriaPrima, models.DO_NOTHING)

    class Meta:
        db_table = "proveen"


class Registra(models.Model):
    id          = models.AutoField(primary_key=True)
    empleado_id = models.ForeignKey(
        Empleado, models.DO_NOTHING
    )  
    pedido_id   = models.ForeignKey(Pedido, models.DO_NOTHING)

    class Meta:
        db_table = "registra"
