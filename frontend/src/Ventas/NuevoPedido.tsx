import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MLventas } from "../componentes/MenuLateral";
import { Link } from "react-router-dom";
import { Label } from "../componentes/TextLabel";
import { BtnIcon } from "../componentes/Boton";
import "../componentes/Boton.css";
import { useEffect, useState } from "react";
import "../componentes/Tabla.css";
import Select from "react-select";
import axios from "axios";
import { AgregarCliente, PopUpError, PopUpExito } from "../componentes/Popup";

interface Producto {
  producto_id: number;
  nombre: string;
  precio: number;
  cantidad: number;
  subtotal: number;
}

interface Cliente {
  ID: number;
  nombres: string;
  apellidos: string;
  DNI: string;
}

function NuevoPedido() {
  // variables

  const seccionActual = "Pedidos";

  const customStyles = {
    control: (provided: any, state: any) => ({
      ...provided,
      width: "300px",
      border: "2px solid #D7DADB",
      borderRadius: "5px",
      padding: "2px 0",
      overflow: "hidden",
    }),
  };

  const [popAgregarCliente, setPopAgregarCliente] = useState(false);

  const [datos, setData] = useState<Cliente[]>([]);

  const [datosProducto, setDatosProducto] = useState<Producto[]>([]);

  const [clienteSeleccionado, setClienteSeleccionado] =
    useState<Cliente | null>(null);

  const [idPedido, setIdPedido] = useState(1);

  const [idCliente, setID] = useState(0);

  const [lnPedido, setLnPedido] = useState<Producto[]>([]);

  const [idProducto, setProducto] = useState(null);

  const [precio, setPrecio] = useState(0);

  const [cantidad, setCantidad] = useState(1);

  const [subtotal, setSubtotal] = useState<number>(0);

  const [total, setTotal] = useState<number>(0);

  const [tipoComprobantes, setTipoComprobante] = useState("");

  const [[popUpExito, msj], setPopUpExito] = useState([false, ""]);

  const [nomProd, setNomProd] = useState("");

  const [radioSeleccionado, setRadioSeleccionado] = useState(false);

  const [cuotasSeleccionadas, setCuotasSeleccionadas] = useState(1);

  const [[popUpError, msjError], setPopUpError] = useState([false, ""]);

  // funciones para manejar el cambio

  const handleClienteChange = (selectedOption: any) => {
    setClienteSeleccionado(selectedOption.value);
    setID(selectedOption.value.ID);
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

  const handleComprobanteChange = (selectedOption: any) => {
    setTipoComprobante(selectedOption.value);
    console.log(selectedOption.value);
  };

  const handleProductoChange = (selectedOption: any) => {
    setProducto(selectedOption.value.ID);
    setNomProd(selectedOption.value.nombre);
    setPrecio(selectedOption.value.precio);
  };

  const handleRadioChange = () => {
    // Lógica para manejar el cambio de selección del botón de radio
    setRadioSeleccionado(!radioSeleccionado);

    // Si se selecciona la opción "Efectivo", establece cuotasSeleccionadas en '1'
    if (radioSeleccionado) {
      setCuotasSeleccionadas(1);
    }
  };

  const handleCuotasChange = (event: any) => {
    setCuotasSeleccionadas(event.target.value);
  };

  // gets de la BD

  useEffect(() => {
    // Realizar la solicitud GET a la API
    axios
      .get<Producto[]>("http://127.0.0.1:8000/api/productos/")
      .then((response) => {
        // Actualizar el estado con los datos obtenidos
        setDatosProducto(response.data);
      })
      .catch((error) => {
        console.error("Error al obtener datos:", error);
      });
  }, []);

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

  const obtenerPedidos = async () => {
    try {
      // Realizar la solicitud GET a la API utilizando Axios
      const response = await axios.get("http://127.0.0.1:8000/api/pedidos/");

      // Obtener la lista de IDs de todos los pedidos
      const listaIds = response.data.map((pedido: any) => pedido.ID);

      // Encontrar el ID más grande usando Math.max
      const maxId = Math.max(...listaIds);

      // Guardar el ID más grande en el estado
      setIdPedido(maxId);
    } catch (error) {
      console.error("Error al obtener los pedidos:", error);
    }
  };

  useEffect(() => {
    // Calcula el subtotal cada vez que cambian los valores
    setSubtotal(cantidad * precio);
  }, [cantidad, precio]);

  // post de la BD

  const onSubmit = async (formData: any) => {
    try {
      const response = await axios.post("http://127.0.0.1:8000/api/pedidos/", {
        cliente_id: idCliente,
        tipo_comprobante: tipoComprobantes,
        forma_pago: formData.forma_pago,
        observacion: formData.observacion,
        cuotas: formData.cuotas,
        total: total,
      });

      obtenerPedidos();
      asociarLineasDeProductos(idPedido);
      console.log(response);
      // Mostrar el popup
      setPopUpExito([!popUpExito, "¡Pedido creado con exito!"]);

      // Primer timeout para ocultar el popup después de 500 milisegundos
      setTimeout(() => {
        setPopUpExito((prevPopUpExito) => [
          !prevPopUpExito,
          "¡Pedido creado con exito!",
        ]);
      }, 1100);

      // Segundo timeout para recargar la página después de 2000 milisegundos (2 segundos)
      setTimeout(() => {
        window.location.reload();
      }, 1110);
    } catch (error) {
      // Manejar errores aquí
      console.error("Error al enviar el formulario:", error);
    }
  };

  //Otras funciones

  const options = datos.map((cliente) => ({
    value: cliente,
    label: `${cliente.nombres} ${cliente.apellidos}`,
  }));

  const opcionesProductos = datosProducto.map((producto) => ({
    value: producto,
    label: `${producto.nombre}`,
  }));

  const comprobantes = [
    { value: "Responsable inscripto", label: "Responsable inscripto" },
    { value: "Consumidor final", label: "Consumidor final" },
    {
      value: "Responsable monotributo",
      label: "Responsable monotributo",
    },
  ];

  const calcularSubtotal = () => {
    const nuevoSubt = cantidad * precio;
    setSubtotal(Number(nuevoSubt.toFixed(2)));
    setTotal(Number((total + subtotal).toFixed(2)));
    agregarProducto();
  };

  const agregarProducto = () => {
    let nuevaCantidad = cantidad;
    let nuevoSubtotal = subtotal;

    if (cantidad < 1) {
      nuevaCantidad = 1;
      nuevoSubtotal = precio;
      setCantidad(1);
    }

    const listaProductos: Producto = {
      producto_id: Number(idProducto),
      nombre: nomProd,
      cantidad: nuevaCantidad,
      precio: precio,
      subtotal: nuevoSubtotal,
    };
    if (lnPedido.length !== 0) {
      setLnPedido([...lnPedido, listaProductos]);
    } else {
      setPopUpError([!popUpError, "Error: ingrese un producto"]);
      setTimeout(() => {
        setPopUpError([false, "Error: ingrese un producto"]);
      }, 1100);
    }

    setCantidad(1);
  };

  const eliminarProducto = (index: number) => {
    const productoEliminado = lnPedido[index];

    const nuevaLista = [...lnPedido];
    nuevaLista.splice(index, 1);
    console.log(productoEliminado.subtotal);
    // Resta el subtotal del producto eliminado al total
    setTotal(Number((total - productoEliminado.subtotal).toFixed(2)));
    console.log(productoEliminado.subtotal);
    // Actualiza la lista de productos
    setLnPedido(nuevaLista);
  };

  const { register: register1, handleSubmit: handleSubmit1 } = useForm({
    defaultValues: {
      forma_pago: "Efectivo",
      observacion: "",
      cuotas: "1",
    },
  });

  const asociarLineasDeProductos = async (pedidoId: number) => {
    try {
      // Realizar una solicitud POST para asociar cada línea de producto al pedido
      for (const producto of lnPedido) {
        const resp = await axios.post(
          "http://127.0.0.1:8000/api/linea_pedidos/",
          {
            ...producto,
            pedido_id: pedidoId,
          }
        );
        console.log(resp);
      }
    } catch (error) {
      console.error("Error al asociar las líneas de productos:", error);
    }
  };

  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <PopUpError estado={popUpError} msj={msjError} />
      <PopUpExito estado={popUpExito} msj={msj} />
      <AgregarCliente
        estado={popAgregarCliente}
        cambiarEstado={setPopAgregarCliente}
        mensajeExito={setPopUpExito}
      />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="flex justify-center ">
          <div className=" w-[70%] flex-col gap-[20px] flex">
            <form onSubmit={handleSubmit1(onSubmit)}>
              <div className="flex justify-between ">
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
                />
              </div>

              {/* Cargar pedido */}
              <div className="flex gap-[20px] flex-col flex-wrap">
                {/* Seleccionar Cliente y tipo comprobante*/}

                <div className="flex flex-col flex-wrap gap-[20px] bg-[#fff] shadow rounded-[5px] py-[15px] px-[25px]">
                  <Label texto="Datos del Pedido" estilo="text-2xl" />

                  <div className="flex justify-between">
                    <div className="flex gap-[15px]">
                      <div className="flex flex-col gap-[10px]">
                        <Label texto="Cliente" estilo="" />
                        <Select
                          options={options}
                          onChange={handleClienteChange}
                          styles={customStyles}
                          required
                        />
                      </div>
                      {/* Establecer el dni */}
                      {clienteSeleccionado ? (
                        <div className="flex flex-col gap-[10px] ">
                          <Label texto="DNI" estilo="" />
                          <div className="flex gap-[10px] ">
                            <input
                              className=" border-solid border-2 rounded-[5px] px-[10px] py-[8px] border-[#D7DADB] overflow-hidden w-[120px] "
                              type="text"
                              readOnly
                              value={clienteSeleccionado.DNI}
                            />
                          </div>
                        </div>
                      ) : (
                        <div className="flex flex-col gap-[10px]">
                          <Label texto="DNI" estilo="" />
                          <div className="flex gap-[10px] ">
                            <input
                              className=" border-solid border-2 rounded-[5px] px-[10px] py-[8px] border-[#D7DADB] overflow-hidden  w-[120px] "
                              type="text"
                              readOnly
                              value=""
                            />
                          </div>
                        </div>
                      )}
                      <div className="h-[75px] items-end flex">
                        <BtnIcon
                          icono="person_add"
                          accion={() => {
                            setPopAgregarCliente(!popAgregarCliente);
                          }}
                          texto=""
                          estilo="bg-[--c5] text-[--c6] h-[40px] w-[40px] justify-center items-center pt-1 rounded-[5px] btnAgregar "
                        />
                      </div>
                    </div>
                    {/* Tipo de comprobante */}
                    <div className="flex flex-col gap-[10px]">
                      <Label texto="Tipo de Comprobante" estilo="" />
                      <Select
                        options={comprobantes}
                        required
                        onChange={handleComprobanteChange}
                        styles={customStyles}
                        value={comprobantes.find(
                          (option) => option.value === tipoComprobantes
                        )}
                      />
                    </div>
                    {/* Seleccionar forma de pago  */}
                    <div className="flex gap-[20px]">
                      <div className="flex flex-col gap-[20px]">
                        <Label texto="Forma de Pago" estilo="" />
                        <div className="flex gap-[10px] ">
                          <div className="flex gap-[10px] ">
                            <input
                              type="radio"
                              id="opcion1"
                              value="Efectivo"
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
                                {...register1("forma_pago")}
                                id="opcion2"
                                value="Tarjeta"
                                checked={radioSeleccionado}
                                onChange={handleRadioChange}
                              />
                              <label htmlFor="opcion2">Tarjeta</label>
                            </div>
                          </div>
                        </div>
                      </div>
                      {/* Cuotas*/}
                      <div className="flex flex-col gap-[10px]">
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
                          {...register1("cuotas")}
                          onChange={handleCuotasChange}
                          defaultValue="1">
                          <option value="1">1</option>
                          <option value="3">3</option>
                          <option value="6">6</option>
                          <option value="12">12</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                {/* Añadir ln pedido */}
                <div className="flex gap-[20px] flex-col bg-[#fff] shadow rounded-[5px] py-[15px] px-[25px]">
                  <Label texto="Detalles del Pedido" estilo="text-2xl" />
                  <div className="flex gap-[20px] flex-wrap">
                    {/* Añadir Producto */}
                    <div className="flex gap-[15px]">
                      <div className="flex flex-col gap-[10px]">
                        <Label texto="Producto" estilo="" />
                        <Select
                          options={opcionesProductos}
                          onChange={handleProductoChange}
                          styles={customStyles}
                          required
                        />
                      </div>

                      {/* Precio unitario del producto, se añade automaticamente */}
                      <div className="flex flex-col gap-[10px]">
                        <Label texto="Precio Unitario" estilo="" />
                        <input
                          className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden"
                          value={precio}
                        />
                      </div>

                      {/* Añadir cantidad */}
                      <div className="flex flex-col gap-[10px]">
                        <Label texto="Cantidad" estilo="" />
                        <div className="flex gap-[10px]">
                          <input
                            className="w-[120px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden bg-[#fff]"
                            type="number"
                            value={cantidad === 0 ? "" : cantidad}
                            onChange={handleCantidadChange}
                          />
                          <button
                            className="bg-[--c5] text-[--c6] h-[40px] w-[40px] justify-center pt-1 rounded-[5px] btnAgregar"
                            type="button"
                            onClick={calcularSubtotal}>
                            <span className="material-symbols-outlined hover:text-[--c5]">
                              add
                            </span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Lineas de pedido */}
                  <Label texto="Pedido" estilo="" />
                  <div className="flex gap-[20px] flex-col h-[26vh] overflow-y-auto border-2 border-[--c9]">
                    <table>
                      <thead className="sticky top-0 ">
                        <tr>
                          <th className="w-[5%]"></th>
                          <th className="w-[5%]">ID</th>
                          <th className="w-[45%]">Producto</th>
                          <th className="w-[15%]">Precio</th>
                          <th className="w-[15%]">Cantidad</th>
                          <th className="w-[15%]">Subtotal</th>
                        </tr>
                      </thead>
                      <tbody>
                        {lnPedido.map((producto, index) => (
                          <tr key={index}>
                            <td className="text-center">
                              <button
                                type="button"
                                onClick={() => eliminarProducto(index)}>
                                <span className="material-symbols-outlined hover:text-[--c5]">
                                  delete
                                </span>
                              </button>
                            </td>
                            <td>{index + 1}</td>
                            <td>{producto.nombre}</td>
                            <td>{producto.precio}</td>
                            <td>{producto.cantidad}</td>
                            <td>{producto.subtotal}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                  <div className="flex gap-[10px]  items-center">
                    <div className="flex gap-[10px] flex-col w-full h-[40px]">
                      <textarea
                        className="w-full border-solid border rounded-[5px] px-[10px] border-bordes-input overflow-hidden 
                 focus:border-green focus:border-solid focus:border-2 focus:outline-none p-[5px] resize-none"
                        placeholder="Observación"
                        {...register1("observacion")}
                      />
                    </div>
                    <div className="flex gap-[20px] items-center">
                      <Label texto="Total" estilo="text-2xl" />
                      <input
                        type="number"
                        className="w-[160px] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden"
                        value={total}
                        readOnly
                      />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}

export default NuevoPedido;
