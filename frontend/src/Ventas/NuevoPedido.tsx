import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MLventas } from "../componentes/MenuLateral";
import { Link } from "react-router-dom";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";
import { AGCliente, AGTable, AGProducto } from "../componentes/AGTable";
import { useCallback, useEffect, useState } from "react";

import "../componentes/Tabla.css";
interface Producto {
  nombre: string;
  precio: string;
  cant: string;
  subtot: string;
}

function NuevoPedido() {
  const seccionActual = "Pedidos";

  const handleProductSelected = (productName: any, productPrice: any) => {
    setSelectedProductName(productName);
    setSelectedProductPrice(productPrice);
  };

  const handleCliente = (nombre: string, apellido: string) => {
    setNombreCliente(nombre);
    setApeCliente(apellido);
  };

  const [lnPedido, setLnPedido] = useState<Producto[]>([]);

  const [nombreCliente, setNombreCliente] = useState("");
  const [apeCliente, setApeCliente] = useState("");
  // Nombre del producto
  const [selectedProductName, setSelectedProductName] = useState("");

  // Precio del producto
  const [selectedProductPrice, setSelectedProductPrice] = useState(0);

  const [cantidad, setCantidad] = useState(0);

  const [subtotal, setSubtotal] = useState<number>(0);

  const [total, setTotal] = useState<number>(0);

  const handleCantidadChange = (event: any) => {
    // Obtener el nuevo valor del input
    const nuevoValor = event.target.value;

    // Verificar si el nuevo valor es un número y no tiene ceros a la izquierda
    if (/^[1-9]\d*$/.test(nuevoValor) || nuevoValor === "") {
      // Actualizar el estado con el nuevo valor de cantidad
      setCantidad(Number(nuevoValor));
    }
  };

  const calcularSubtotal = () => {
    console.log(cantidad, selectedProductPrice);
    const nuevoSubt = cantidad * selectedProductPrice;
    setSubtotal(Number(nuevoSubt.toFixed(2)));
    setTotal(Number((total + subtotal).toFixed(2)));
    console.log(subtotal);

    agregarProducto();
  };
  useEffect(() => {
    // Calcula el subtotal cada vez que cambian los valores
    setSubtotal(cantidad * selectedProductPrice);
  }, [cantidad, selectedProductPrice]);

  const agregarProducto = () => {
    const nuevoProducto: Producto = {
      nombre: selectedProductName,
      precio: selectedProductPrice.toString(),
      cant: cantidad.toString(),
      subtot: subtotal.toString(),
    };
    setLnPedido([...lnPedido, nuevoProducto]);

    // Reiniciar los estados para la próxima entrada
    setSelectedProductName("");
    setSelectedProductPrice(0);
    setCantidad(0);
  };

  const eliminarProducto = (index: number) => {
    const productoEliminado = lnPedido[index];

    const nuevaLista = [...lnPedido];
    nuevaLista.splice(index, 1);
    console.log(productoEliminado.subtot);
    // Resta el subtotal del producto eliminado al total
    setTotal(Number((total - parseFloat(productoEliminado.subtot)).toFixed(2)));
    console.log(productoEliminado.subtot);
    // Actualiza la lista de productos
    setLnPedido(nuevaLista);
  };

  const handleSubmit = async (event: any) => {
    event.preventDefault();

    try {
      const response = await fetch("http://127.0.0.1:8000/api/clientes/", {
        method: "Post",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          nombreCliente,
          apeCliente,
          cuotas: cuotasSeleccionadas,
          total,
        }),
      });

      if (response.ok) {
        console.log("Datos enviados exitosamente");
      } else {
        console.error("Error al enviar datos");
      }
    } catch (error) {
      console.error("Error en la solicitud:", error);
    }
  };

  const [radioSeleccionado, setRadioSeleccionado] = useState(false);

  const handleRadioChange = () => {
    // Lógica para manejar el cambio de selección del botón de radio
    setRadioSeleccionado(!radioSeleccionado);

    // Si se selecciona la opción "Efectivo", establece cuotasSeleccionadas en '1'
    if (radioSeleccionado) {
      setCuotasSeleccionadas(1);
    }
  };

  const [cuotasSeleccionadas, setCuotasSeleccionadas] = useState(1);

  const handleCuotasChange = (event: any) => {
    // Lógica para manejar el cambio en la lista desplegable de cuotas
    setCuotasSeleccionadas(event.target.value);
  };

  const [descripcion, setDescripcion] = useState("");
  const handleDescripcionChange = (event: any) => {
    setDescripcion(event.target.value);
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

        <form onSubmit={handleSubmit}>
          <div className="flex gap-[40px]">
            {/* Cargar pedido */}
            <div className="flex gap-[20px] flex-col flex-wrap">
              {/* Seleccionar Cliente y forma de pago*/}
              <div className="flex gap-[20px]">
                <div className="flex flex-col gap-[10px]">
                  <Label texto="Cliente" estilo="" />
                  <AGCliente
                    endpointPath={"http://127.0.0.1:8000/api/clientes/"}
                    clienteSeleccionado={handleCliente}
                  />
                  <input
                    className="w-[200px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden"
                    type="text"
                    value={nombreCliente + " " + apeCliente}
                    readOnly
                  />
                </div>

                {/* Seleccionar forma de pago y cuotas */}
                <div className="flex flex-col gap-[10px]">
                  <Label texto="Forma de Pago" estilo="" />
                  <div className="flex gap-[10px]">
                    <input
                      type="radio"
                      name="grupo"
                      id="opcion1"
                      value="opcion1"
                      checked={!radioSeleccionado}
                      onChange={handleRadioChange}
                      defaultChecked
                    />
                    <label htmlFor="opcion1">Efectivo</label>
                  </div>

                  <div className="flex flex-col gap-[5px]">
                    <div className="flex gap-[10px]">
                      <input
                        type="radio"
                        name="grupo"
                        id="opcion2"
                        value="opcion2"
                        checked={radioSeleccionado}
                        onChange={handleRadioChange}
                      />
                      <label htmlFor="opcion2">Tarjeta</label>
                    </div>
                    <Label texto="Cuotas" estilo="" />
                    <select
                      className={`w-[50px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden ${
                        radioSeleccionado ? "editable" : ""
                      }`}
                      disabled={!radioSeleccionado}
                      style={{
                        backgroundColor: radioSeleccionado ? "white" : "",
                      }}
                      value={cuotasSeleccionadas}
                      onChange={handleCuotasChange}>
                      <option value="1">1</option>
                      <option value="3">3</option>
                      <option value="6">6</option>
                      <option value="12">12</option>
                    </select>
                  </div>
                </div>
              </div>
              {/* Añadir ln pedido */}
              <div className="flex  gap-[20px]">
                {/* Seleccionar producto  */}
                <div className="flex flex-col gap-[10px] ">
                  <Label texto="Cargar Producto" estilo="" />
                  <AGProducto
                    endpointPath={"http://127.0.0.1:8000/api/productos/"}
                    productoSeleccionado={handleProductSelected}
                  />
                </div>
                {/* Añadir linea pedido */}
                <div className="flex gap-[10px]">
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
                    <div className="flex gap-[10px]">
                      <input
                        className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden bg-white-1"
                        type="number"
                        value={cantidad === 0 ? "" : cantidad}
                        onChange={handleCantidadChange}
                      />

                      <BtnIcon
                        icono="add"
                        accion={calcularSubtotal}
                        texto=""
                        estilo="bg-[--c5] text-[--c6] h-[38px] w-[38px] justify-center pt-1 rounded-[5px] btnAgregar"
                      />
                    </div>
                  </div>
                </div>
              </div>

              <textarea
                className="w-full border-solid border rounded-[5px] px-[10px] border-bordes-input overflow-hidden 
                h-[200px] focus:border-green focus:border-solid focus:border-2 focus:outline-none p-[5px] resize-none"
                placeholder="Descripción"
                value={descripcion}
                onChange={handleDescripcionChange}
              />
            </div>

            {/* Lineas de pedido */}
            <div className="flex gap-[20px] flex-col">
              <Label texto="Pedido" estilo="" />
              <table>
                <thead>
                  <tr>
                    <th className="w-[20px]"></th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                    <th className="w-[20px]"></th>
                  </tr>
                </thead>
                <tbody>
                  {lnPedido.map((producto, index) => (
                    <tr key={index}>
                      <td className="text-center">{index + 1}</td>
                      <td>{producto.nombre}</td>
                      <td>{producto.precio}</td>
                      <td>{producto.cant}</td>
                      <td>{producto.subtot}</td>
                      <td className="text-center">
                        <button
                          type="button"
                          onClick={() => eliminarProducto(index)}>
                          <span className="material-symbols-outlined">
                            delete
                          </span>
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
              <div>
                <Label texto="Total" estilo="text-2xl" />
                <input
                  type="number"
                  className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden"
                  value={total}
                  readOnly
                />
              </div>
              <Btn tipo="submit" estilo="btnImprimir" valor="Guardar Pedido" />
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

export default NuevoPedido;
