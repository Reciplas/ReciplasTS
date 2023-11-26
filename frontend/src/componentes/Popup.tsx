import { useForm } from "react-hook-form";
import { BtnIcon } from "./Boton";
import { Label, LabelObligatorio } from "./TextLabel";
import "./Boton.css";
import axios from "axios";
import { useEffect, useState } from "react";

import "./Tabla.css";

export function PopUpDetalle({
  estado,
  cambiarEstado,
  datos,
  id_pedido,
  deseleccionar,
  mensajeExito,
}: {
  estado: boolean;
  cambiarEstado: React.Dispatch<React.SetStateAction<boolean>>;
  datos: Array<any>;
  id_pedido: number;
  deseleccionar: any;
  mensajeExito: React.Dispatch<React.SetStateAction<[boolean, string]>>;
}) {
  const cerrarPopUp = () => {
    cambiarEstado(!estado);
    deseleccionar();
  };
  console.log("Datos:", datos);

  interface Pedido {
    ID: number;
    nombres: string;
    apellidos: string;
    tipo: string;
    forma_pago: string;
    cuotas: string;
    fecha_creacion: Date | any;
    observación: string;
    total: number;
    dir_cliente: string;
    email_cliente: string;
    tel_cliente: number;
    dni_cliente: number;
  }
  interface Producto {
    producto_id: number;
    producto_nombre: string;
    precio: number;
    cantidad: number;
    subtotal: number;
  }
  const [pedido, setPedido] = useState<Pedido>();
  const [productos, setProductos] = useState<Producto[]>([]);
  const [estadoSeleccionado, setEstadoSeleccionado] = useState("");
  const [estadoOriginal, setEstadoOriginal] = useState("");

  useEffect(() => {
    // Realizar ambas solicitudes usando Axios
    if (id_pedido !== null && id_pedido !== undefined) {
      axios
        .all([
          axios.get(`http://127.0.0.1:8000/api/pedidos/${id_pedido}`),
          axios.get(`http://127.0.0.1:8000/api/linea_pedidos/${id_pedido}`),
        ])
        .then(
          axios.spread((pedidoResponse, productosResponse) => {
            // Actualizar el estado con los datos obtenidos
            setPedido(pedidoResponse.data);
            setProductos(productosResponse.data);
            console.log("Pedido:", pedidoResponse.data);
            console.log("Líneas de pedido:", productosResponse.data);
            setEstadoSeleccionado(pedidoResponse.data.estado);
            setEstadoOriginal(pedidoResponse.data.estado);
          })
        )
        .catch((error) => {
          console.error("Error al obtener datos:", error);
        });
    }
  }, [id_pedido]);

  const guardarCambios = async () => {
    if (estadoSeleccionado !== estadoOriginal) {
      try {
        // Realizar la solicitud PUT a la API con el nuevo estado
        await axios.put(`http://127.0.0.1:8000/api/pedidos/${id_pedido}`, {
          estado: estadoSeleccionado,
        });

        cerrarPopUp();
        mensajeExito([true, "El estado ha sido modificado"]);
        setTimeout(() => {
          mensajeExito([false, "El estado ha sido modificado"]);
        }, 1150);
        setTimeout(() => {
          window.location.reload();
        }, 1150);
      } catch (error) {
        console.error("Error al guardar cambios:", error);
      }
    } else {
      cerrarPopUp();
    }
  };

  return (
    <>
      {estado && (
        <div className="fixed inset-0 flex items-center justify-center z-50 w-full h-full bg-[#1F1F1F] bg-opacity-50">
          <div className="z-51 bg-[--c11] shadow-xl border-solid border-2 border-[--c12]   bg-gray-800 r p-6 w-full max-w-2xl bg-gray-800 rounded-lg flex flex-col gap-[15px] max-h-[90%]">
            <div className=" divide-[--c12] divide-y-2">
              <div className="flex justify-between">
                <h2 className="text-2xl font-bold text-gray-200 mb-4">
                  N° pedido {id_pedido}
                </h2>
                <h2 className="text-2xl font-bold text-gray-200 mb-4">
                  Fecha: {pedido?.fecha_creacion}
                </h2>
              </div>

              <div></div>
            </div>
            <div className="flex flex-col gap-[10px]">
              <div className="flex justify-between">
                <div className="flex gap-[5px]">
                  <div className="flex flex-col gap-[10px]">
                    <p className="font-[600]">Cliente:</p>
                    <p className="font-[600]">DNI:</p>
                    <p className="font-[600]">Teléfono:</p>
                    <p className="font-[600]">Correo:</p>
                    <p className="font-[600]">Dirección:</p>
                    <p className="font-[600]">Tipo:</p>
                  </div>
                  <div className="flex flex-col gap-[10px]">
                    <p>
                      {pedido?.nombres} {pedido?.apellidos}
                    </p>
                    <p>{pedido?.dni_cliente}</p>
                    <p>{pedido?.tel_cliente}</p>
                    <p>{pedido?.email_cliente}</p>
                    <p>{pedido?.dir_cliente}</p>
                    <p>{pedido?.tipo}</p>
                  </div>
                </div>
                <div className="flex flex-col gap-[10px] text-right">
                  <p className="font-[600]">Estado</p>
                  <label className="flex gap-[15px] justify-between">
                    <input
                      className="accent-[--c5]"
                      type="radio"
                      value="Pendiente"
                      checked={estadoSeleccionado === "Pendiente"}
                      onChange={() => setEstadoSeleccionado("Pendiente")}
                    />
                    Pendiente
                  </label>

                  <label className="flex gap-[15px] justify-between">
                    <input
                      className="accent-[--c5]"
                      type="radio"
                      value="Fabricación"
                      checked={estadoSeleccionado === "Fabricación"}
                      onChange={() => setEstadoSeleccionado("Fabricación")}
                    />
                    Fabricación
                  </label>

                  <label className="flex gap-[10px] justify-between">
                    <input
                      className="accent-[--c5]"
                      type="radio"
                      value="Entrega"
                      checked={estadoSeleccionado === "Entrega"}
                      onChange={() => setEstadoSeleccionado("Entrega")}
                    />
                    Entrega
                  </label>

                  <label className="flex gap-[10px] justify-between">
                    <input
                      className="accent-[--c5]"
                      type="radio"
                      value="Finalizado"
                      checked={estadoSeleccionado === "Finalizado"}
                      onChange={() => setEstadoSeleccionado("Finalizado")}
                    />
                    Finalizado
                  </label>
                  <label className="flex gap-[10px] justify-between">
                    <input
                      className="accent-[#FF0000]"
                      type="radio"
                      value="Cancelado"
                      checked={estadoSeleccionado === "Cancelado"}
                      onChange={() => setEstadoSeleccionado("Cancelado")}
                    />
                    Cancelado
                  </label>
                </div>
              </div>

              <div className="flex gap-[20px] flex-col  max-h-[300px] overflow-y-auto border-2 border-[--c9]">
                <table>
                  <thead className="sticky top-0 ">
                    <tr>
                      <th className="w-[5%]">ID</th>
                      <th className="w-[45%]">Producto</th>
                      <th className="w-[15%]">Precio</th>
                      <th className="w-[15%]">Cantidad</th>
                      <th className="w-[20%]">Subtotal</th>
                    </tr>
                  </thead>
                  <tbody>
                    {productos.map((producto, index) => (
                      <tr key={index}>
                        <td>{1 + index}</td>
                        <td>{producto.producto_nombre}</td>
                        <td>{producto.precio}</td>
                        <td>{producto.cantidad}</td>
                        <td>{"$" + producto.subtotal}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <div></div>

              <div className="flex justify-between">
                <div className="flex gap-[30px]">
                  <div className="flex gap-[5px]">
                    <p className="font-[600]">Forma de pago:</p>
                    <p>{pedido?.forma_pago}</p>
                  </div>
                  <div className="flex gap-[5px]">
                    <p className="font-[600]">Cuotas:</p>
                    <p>{pedido?.cuotas}</p>
                  </div>
                </div>

                <div className="flex gap-[5px] mr-[23px]">
                  <p className="font-[600] uppercase">Total:</p>
                  <p>{"$" + pedido?.total}</p>
                </div>
              </div>
              <p className="font-[600]">Observación:</p>
              <div className="border-solid border-2 border-[--c12] p-[5px] rounded-md min-h-[30px]">
                <p>{pedido?.observación}</p>
              </div>
            </div>
            <div className="flex justify-end items-end gap-[10px]">
              <button
                className=" text-white px-4 py-2 rounded btnImprimir2"
                onClick={cerrarPopUp}>
                Cerrar
              </button>
              <button
                onClick={guardarCambios}
                className="text-white px-4 py-2 rounded btnImprimir">
                Guardar
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export function AgregarCliente({
  estado,
  cambiarEstado,
  mensajeExito,
}: {
  estado: boolean;
  cambiarEstado: React.Dispatch<React.SetStateAction<boolean>>;
  mensajeExito: React.Dispatch<React.SetStateAction<[boolean, string]>>;
}) {
  const cerrarPopUp = () => {
    cambiarEstado(!estado);
  };

  const {
    register: register,
    handleSubmit: handleSubmit,
    formState: { errors },
  } = useForm({
    defaultValues: {
      nombres: "",
      apellidos: "",
      dni: "",
      fec_nac: "",
      celular: 0,
      celular_alt: 0,
      email: "",
      direccion: "",
    },
  });

  const onSubmit = async (data: any) => {
    try {
      const response = await axios.post("http://127.0.0.1:8000/api/clientes/", {
        nombres: data.nombres,
        apellidos: data.apellidos,
        dni: data.dni,
        fec_nac: data.fec_nac,
        celular: data.celular,
        celular_alt: data.celular_alt,
        email: data.email,
        direccion: data.direccion,
      });

      console.log(response);
      cerrarPopUp();
      mensajeExito([true, "¡Cliente creado con exito!"]);
      setTimeout(() => {
        mensajeExito([false, "¡Cliente creado con exito!"]);
      }, 1150);
      setTimeout(() => {
        window.location.reload();
      }, 1150);
    } catch (error) {
      // Manejar errores aquí
      console.error("Error al enviar el formulario:", error);
    }
  };

  return (
    <>
      {estado && (
        <div className="fixed inset-0 flex items-center justify-center z-50 w-full h-full bg-[#1F1F1F] bg-opacity-50">
          <div className="z-51 bg-[--c11] shadow-xl border-solid border-2 border-[--c12]   bg-gray-800 r p-6 w-full max-w-md bg-gray-800 rounded-lg flex flex-col gap-[15px]">
            <div className=" divide-[--c12] divide-y-2">
              <h2 className="text-2xl font-bold text-gray-200 mb-4">
                Registrar Nuevo Cliente
              </h2>
              <div></div>
            </div>

            <form
              className="flex flex-col gap-[15px]"
              onSubmit={handleSubmit(onSubmit)}>
              <div className="flex flex-col gap-[15px]">
                <div className="flex space-x-4 ">
                  <div>
                    <LabelObligatorio texto={"Nombre"} />
                    <input
                      type="text"
                      {...register("nombres")}
                      required
                      className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                    />
                  </div>
                  <div>
                    <LabelObligatorio texto={"Apellido"} />
                    <input
                      type="text"
                      {...register("apellidos")}
                      required
                      className="bg-gray-700 text-gray-200 border-0 rounded-md p-2  focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                    />
                  </div>
                </div>
                <div>
                  <LabelObligatorio texto={"DNI"} />
                  <input
                    type="number"
                    {...register("dni", {
                      pattern: {
                        value: /^\d{8}$/,
                        message: "Número invalido",
                      },
                    })}
                    required
                    className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                  />
                </div>
                <div>
                  <LabelObligatorio texto={"Fecha de nacimiento"} />
                  <input
                    type="date"
                    {...register("fec_nac")}
                    required
                    className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                  />
                </div>
                <div>
                  <LabelObligatorio texto={"Celular"} />
                  <input
                    type="tel"
                    {...register("celular", {
                      pattern: /^\d{10}$/,
                    })}
                    required
                    className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                  />
                </div>
                <div>
                  <Label texto={"Celular alternativo"} estilo={"mb-2"} />
                  <input
                    type="tel"
                    {...register("celular_alt")}
                    className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                  />
                </div>
                <div>
                  <LabelObligatorio texto={"Correo Electrónico"} />
                  <input
                    type="email"
                    {...register("email", {
                      pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/i,
                    })}
                    required
                    className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                  />
                </div>
                <div>
                  <LabelObligatorio texto={"Domicilio"} />
                  <div className=" divide-[--c12] divide-y-2 flex flex-col gap-[20px]">
                    <input
                      type="text"
                      {...register("direccion")}
                      required
                      className="bg-gray-700 text-gray-200 border-0 rounded-md p-2 w-full focus:bg-gray-600 focus:outline-none focus:ring-1 focus:ring-blue-500 transition ease-in-out duration-150"
                    />
                    <div></div>
                  </div>
                </div>
              </div>

              <div className="flex justify-end items-end gap-[10px]">
                <button
                  className=" text-white px-4 py-2 rounded btnImprimir2"
                  onClick={cerrarPopUp}>
                  cancelar
                </button>
                <button
                  type="submit"
                  className="text-white px-4 py-2 rounded btnImprimir">
                  Guardar
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </>
  );
}

export function PopUpError({ estado, msj }: { estado: boolean; msj: string }) {
  return (
    <>
      <div className="border-solid border-2 rounded-[5px] border-bordes-input bg-white-1 fixed top-[-140px] left-1/2 transform -translate-x-1/2 z-50 animate-slide-down">
        <div
          className={`bg-white border-solid border-2 rounded-[5px] border-bordes-input bg-[#FF0000] p-4 shadow transition-transform duration-2000 ease-in-out transform ${
            estado ? "translate-y-40" : "translate-y-0"
          }`}>
          <strong className=" text-[#ffffff]">{msj}</strong>
        </div>
      </div>
    </>
  );
}

export function PopUpExito({ estado, msj }: { estado: boolean; msj: string }) {
  return (
    <>
      <div className="border-solid border-2 rounded-[5px] border-bordes-input bg-white-1 fixed top-[-140px] left-1/2 transform -translate-x-1/2 z-50 animate-slide-down">
        <div
          className={`bg-[--c5]  rounded-[5px] p-4 shadow-xl transition-transform duration-2000 ease-in-out transform ${
            estado ? "translate-y-40" : "translate-y-0"
          }`}>
          <strong className=" text-[#ffffff]">{msj}</strong>
        </div>
      </div>
    </>
  );
}

export function Popup({
  opciones,
  estado,
  cambiarEstado,
}: {
  opciones: string[];
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-[150px] h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[10px] z-50">
          <form className="flex gap-0 ">
            {opciones.map((opcion, index) => (
              <div key={index} className="flex gap-[5px] hover:cursor-pointer">
                <input
                  className="peer accent-green"
                  type="radio"
                  id={opcion}
                  name="ratio"
                  value={opcion}
                  defaultChecked={opcion === "Fecha"}
                />
                <label
                  className="hover:cursor-pointer w-fit p-[7px]  peer-checked:font-semibold  ease-in duration-100 "
                  htmlFor={opcion}>
                  {opcion}
                </label>
              </div>
            ))}
          </form>
          <BtnIcon
            estilo="rounded border-bordes-input border-solid border-2 p-[7px] hover:bg-white-4 hover:cursor-pointer transition active:translate-y-[-2px] w-[100%] flex items-center justify-between gap-[2px]"
            texto="Ascendente"
            icono="north"
            accion={() => {}}
          />
        </div>
      )}
    </>
  );
}

export function PopupPeriodo({
  estado,
  cambiarEstado,
}: {
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-fit h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[15px] z-50">
          <div className="flex gap-1 items-center">
            <Label texto="Desde" estilo="w-[50px]" />
            <input
              type="date"
              className="p-1.5   border-solid border-2 border-bordes-input "
            />
          </div>
          <div className="flex gap-1 items-center">
            <Label texto="Hasta" estilo="w-[50px]" />
            <input
              type="date"
              className="p-1.5   border-solid border-2 border-bordes-input "
            />
          </div>
        </div>
      )}
    </>
  );
}

export function PopupPrecio({
  estado,
  cambiarEstado,
}: {
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-fit h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[15px] z-50">
          <div className="flex gap-1 items-center">
            <Label texto="Mínimo($)" estilo="" />
            <input
              type="number"
              className="p-1.5   border-solid border-2 border-bordes-input w-[115px]"
            />
          </div>
          <div className="flex gap-1 items-center">
            <Label texto="Máximo($)" estilo="" />
            <input
              type="number"
              className="p-1.5   border-solid border-2 border-bordes-input w-[115px]"
            />
          </div>
        </div>
      )}
    </>
  );
}

export function PopupCuotas({
  opciones,
  estado,
  cambiarEstado,
}: {
  opciones: string[];
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-[150px] h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[10px] z-50">
          <form className="flex gap-0 ">
            {opciones.map((opcion, index) => (
              <div key={index} className="flex gap-[5px] hover:cursor-pointer">
                <input
                  className="peer accent-green"
                  type="radio"
                  id={opcion}
                  name="ratio"
                  value={opcion}
                  defaultChecked={opcion === "Todos"}
                />
                <label
                  className="hover:cursor-pointer w-fit p-[7px]  peer-checked:font-semibold  ease-in duration-100 "
                  htmlFor={opcion}>
                  {opcion}
                </label>
              </div>
            ))}
          </form>
        </div>
      )}
    </>
  );
}
