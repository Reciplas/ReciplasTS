import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MLventas } from "../componentes/MenuLateral";
import { Link } from "react-router-dom";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";
import { AGCliente, AGTable, AGProducto } from "../componentes/AGTable";
import { useCallback, useState } from "react";

function NuevoPedido() {
  const seccionActual = "Pedidos";

  const handleProductSelected = (productName: any, productPrice: any) => {
    setSelectedProductName(productName);
    setSelectedProductPrice(productPrice);
  };

  // Nombre del producto
  const [selectedProductName, setSelectedProductName] = useState("");

  // Precio del producto
  const [selectedProductPrice, setSelectedProductPrice] = useState("");

  const [subtotal, setSubtotal] = useState(0);

  const [cantidad, setCantidad] = useState(0);

  const calcularSubtotal = () => {
    const nuevoSubtotal = cantidad * parseFloat(selectedProductPrice);
    setSubtotal(nuevoSubtotal);
    console.log(subtotal);
  };

  const handleCantidadChange = (event: any) => {
    // Obtener el nuevo valor del input
    const nuevoValor = event.target.value;

    // Verificar si el nuevo valor es un número y no tiene ceros a la izquierda
    if (/^[1-9]\d*$/.test(nuevoValor) || nuevoValor === "") {
      // Actualizar el estado con el nuevo valor de cantidad
      setCantidad(Number(nuevoValor));
    }
  };

  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <div className="flex">
            <Link to="/Ventas/Pedidos">
              <h1>Pedido</h1>
            </Link>
            <h1>/Nuevo Pedido</h1>
          </div>
        </div>

        <form method="Post">
          <div className="flex gap-[20px] flex-wrap">
            <div className="flex flex-col gap-[10px]">
              <Label texto="Cliente" estilo="" />
              <AGCliente endpointPath={"http://127.0.0.1:8000/api/clientes/"} />
            </div>
            <div className="flex flex-col gap-[10px] ">
              <Label texto="Cargar Producto" estilo="" />
              <AGProducto
                endpointPath={"http://127.0.0.1:8000/api/productos/"}
                productoSeleccionado={handleProductSelected}
              />
            </div>

            <div className="flex gap-[20px]">
              <div className="flex flex-col gap-[10px]">
                <Label texto="Producto" estilo="" />
                <InputTypeText texto={selectedProductName} />
              </div>

              <div className="flex flex-col gap-[10px]">
                <Label texto="Precio Unitario" estilo="" />
                <input
                  className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden"
                  value={selectedProductPrice}
                />
              </div>

              <div className="flex flex-col gap-[10px]">
                <Label texto="Cantidad" estilo="" />
                <input
                  className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden bg-white-5"
                  type="number"
                  value={cantidad === 0 ? "" : cantidad}
                  onChange={handleCantidadChange}
                />
              </div>

              <div className="flex flex-col gap-[10px]">
                <button onClick={calcularSubtotal} type="button">
                  Enviar
                </button>
                <Label texto="Sub-Total" estilo="" />
                <input
                  className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden  "
                  type="number"
                  value={subtotal}
                  readOnly
                />
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

export default NuevoPedido;
