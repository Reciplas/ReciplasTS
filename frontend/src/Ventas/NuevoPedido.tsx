import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MLventas } from "../componentes/MenuLateral";
import { Link } from "react-router-dom";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";
import "../componentes/Boton.css";
import { AGCliente, AGTable, AGProducto } from "../componentes/AGTable";
import { useCallback, useEffect, useState } from "react";

import "../componentes/Tabla.css";
import { UseFetch } from "../componentes/UseFetch";
import Select from "react-select";
import AsyncSelect from "react-select/async";
import axios from "axios";

interface Producto {
  nombre: string;
  precio: string;
  cant: string;
  subtot: string;
}

interface Cliente {
  ID: number;
  nombres: string;
  apellidos: string;
  DNI: string;
}

function NuevoPedido() {
  const seccionActual = "Pedidos";

  const [datos, setData] = useState<Cliente[]>([]);
  const [clienteSeleccionado, setClienteSeleccionado] =
    useState<Cliente | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Realizar la solicitud GET a la API
    axios
      .get<Cliente[]>("http://127.0.0.1:8000/api/clientes/")
      .then((response) => {
        // Actualizar el estado con los datos obtenidos
        setData(response.data);
      })
      .catch((error) => {
        console.error("Error al obtener datos:", error);
      });
  }, []);

  const options = datos.map((cliente) => ({
    value: cliente,
    label: `${cliente.nombres} ${cliente.apellidos}`,
  }));

  const handleClienteChange = (selectedOption: any) => {
    setClienteSeleccionado(selectedOption.value);
  };

  const handleProductSelected = (productName: any, productPrice: any) => {
    setSelectedProductName(productName);
    setSelectedProductPrice(productPrice);
  };
  const [idCliente, setIdCliente] = useState(1);
  const [nombreCliente, setNombreCliente] = useState("");
  const [apeCliente, setApeCliente] = useState("");

  useEffect(() => {
    console.log("idCliente actualizado:", idCliente);
  }, [idCliente]);

  const [lnPedido, setLnPedido] = useState<Producto[]>([]);

  // Nombre del producto
  const [selectedProductName, setSelectedProductName] = useState("");

  // Precio del producto
  const [selectedProductPrice, setSelectedProductPrice] = useState(0);

  const [cantidad, setCantidad] = useState(0);

  const [subtotal, setSubtotal] = useState<number>(0);

  const [total, setTotal] = useState<number>(0);

  const [tipoComprobantes, setTipoComprobante] = useState("");

  const comprobantes = [
    { value: "IVA Responsable inscripto", label: "IVA Responsable inscripto" },
    { value: "IVA Consumidor final", label: "IVA Consumidor final" },
    {
      value: "IVA Responsable monotributo",
      label: "IVA Responsable monotributo",
    },
  ];

  const handleCantidadChange = (event: any) => {
    // Obtener el nuevo valor del input
    const nuevoValor = event.target.comprobante;

    // Verificar si el nuevo valor es un número y no tiene ceros a la izquierda
    if (/^[1-9]\d*$/.test(nuevoValor) || nuevoValor === "") {
      // Actualizar el estado con el nuevo valor de cantidad
      setCantidad(Number(nuevoValor));
    }
  };

  const handleComprobanteChange = (selectedOption: any) => {
    setTipoComprobante(selectedOption.value);
    console.log(selectedOption.value);
  };

  const calcularSubtotal = () => {
    console.log(cantidad, selectedProductPrice);
    const nuevoSubt = cantidad * selectedProductPrice;
    setSubtotal(Number(nuevoSubt.toFixed(2)));
    setTotal(Number((total + subtotal).toFixed(2)));

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

  const [observacion, setObservacion] = useState("");

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    defaultValues: {
      forma_pago: "Efectivo",
      observacion: "",
    },
  });

  const onSubmit = async (formData: any) => {
    // data.preventDefault();
    try {
      let config = {
        method: "post",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          cliente_id: idCliente,
          forma_pago: formData.forma_pago,
          observacion: formData.observacion,
          total: total,
        }),
      };
      let res = await fetch("http://127.0.0.1:8000/api/pedidos/", config);
      let json = await res.json();

      console.log(json);
    } catch (error) {}
  };

  const customStyles = {
    control: (provided: any, state: any) => ({
      ...provided,
      width: "200px",
      border: "2px solid #D7DADB",
      borderRadius: "5px",
      padding: "2px 0",
      overflow: "hidden",
    }),
  };

  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />

        <div className="flex flex-col  justify-between gap-[20px]">
          <form onSubmit={handleSubmit(onSubmit)}>
            <div className="flex justify-between w-full">
              <div className="flex">
                <Link to="/Ventas/Pedidos">
                  <h1>Pedido</h1>
                </Link>
                <h1>/Nuevo Pedido</h1>
              </div>
              <input
                type="submit"
                value="Guardar Pedido"
                className="btnImprimir"
                onClick={() => {
                  console.log("----->>> Guardado");
                }}
              />
            </div>
            <div className="flex gap-[40px]">
              {/* Cargar pedido */}
              <div className="flex gap-[20px] flex-col flex-wrap">
                {/* Seleccionar Cliente y forma de pago*/}

                <div className="flex  gap-[10px]">
                  <div className="flex flex-col gap-[10px]">
                    <Label texto="Cliente" estilo="" />
                    <Select
                      options={options}
                      onChange={handleClienteChange}
                      styles={customStyles}
                    />
                  </div>

                  {clienteSeleccionado ? (
                    <div className="flex flex-col gap-[10px]">
                      <Label texto="DNI" estilo="" />
                      <div className="flex gap-[10px] ">
                        <input
                          className="w-[100%] border-solid border-2 rounded-[5px] px-[5px] py-[5px] border-[#D7DADB] overflow-hidden  "
                          type="text"
                          readOnly
                          value={clienteSeleccionado.DNI}
                        />
                        <BtnIcon
                          icono="person_add"
                          accion={() => {
                            console.log("Agregar cliente");
                          }}
                          texto=""
                          estilo="bg-[--c5] text-[--c6] h-[50px] w-[50px] justify-center items-center pt-1 rounded-[5px] btnAgregar "
                        />
                      </div>
                    </div>
                  ) : (
                    <div className="flex flex-col gap-[10px]">
                      <Label texto="DNI" estilo="" />
                      <div className="flex gap-[10px]">
                        <InputTypeText texto="" />
                        <BtnIcon
                          icono="person_add"
                          accion={() => {
                            console.log("Agregar cliente");
                          }}
                          texto=""
                          estilo="bg-[--c5] text-[--c6] h-[40px] w-[50px] justify-center pt-1 rounded-[5px] btnAgregar "
                        />
                      </div>
                    </div>
                  )}
                  <div className="flex flex-col gap-[10px]">
                    <Label texto="Tipo de Comprobante" estilo="" />
                    <Select
                      options={comprobantes}
                      onChange={handleComprobanteChange}
                      styles={customStyles}
                      value={comprobantes.find(
                        (option) => option.value === tipoComprobantes
                      )}
                    />
                  </div>
                </div>

                {/* Añadir ln pedido */}
                <div className="flex  gap-[20px]">
                  {/* Seleccionar forma de pago y cuotas */}
                  <div className="flex flex-col gap-[10px]">
                    <Label texto="Forma de Pago" estilo="" />
                    <div className="flex gap-[10px]">
                      <input
                        type="radio"
                        id="opcion1"
                        value="Efectivo"
                        // {...register("FormaDePago")}
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
                          {...register("forma_pago")}
                          id="opcion2"
                          value="Tarjeta"
                          checked={radioSeleccionado}
                          onChange={handleRadioChange}
                        />
                        <label htmlFor="opcion2">Tarjeta</label>
                      </div>
                      <Label texto="Cuotas" estilo="" />
                      <select
                        // {...register("Cuotas")}
                        className={`w-[50px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden ${
                          radioSeleccionado ? "editable" : ""
                        }`}
                        disabled={!radioSeleccionado}
                        style={{
                          backgroundColor: radioSeleccionado ? "white" : "",
                        }}
                        value={cuotasSeleccionadas}
                        onChange={handleCuotasChange}
                        defaultValue="1">
                        <option value="1">1</option>
                        <option value="3">3</option>
                        <option value="6">6</option>
                        <option value="12">12</option>
                      </select>
                    </div>
                  </div>
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
                          className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden bg-[#fff]"
                          type="number"
                          value={cantidad === 0 ? "" : cantidad}
                          onChange={handleCantidadChange}
                        />

                        <BtnIcon
                          icono="add"
                          accion={calcularSubtotal}
                          texto=""
                          estilo="bg-[--c5] text-[--c6] h-[40px] w-[40px] justify-center pt-1 rounded-[5px] btnAgregar"
                        />
                      </div>
                    </div>
                  </div>
                </div>
                <Label texto="Obeservación" estilo="" />
                <textarea
                  className="w-full border-solid border rounded-[5px] px-[10px] border-bordes-input overflow-hidden 
                h-auto focus:border-green focus:border-solid focus:border-2 focus:outline-none p-[5px] resize-none"
                  // value={observacion}
                  // onChange={handleObservacionChange}
                  {...register("observacion")}
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
                {/* <Btn tipo="submit" estilo="btnImprimir" valor="Guardar Pedido" /> */}
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default NuevoPedido;
