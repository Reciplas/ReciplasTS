import { MenuLateralProduccion } from "../componentes/MenuLateral/MenuLateral";
import "../App.css";
import Header from "../componentes/Header/Header";
import { Btn, BtnRatio, BtnBuscador } from "../componentes/Boton/Boton";
import { TablaEditable4, Paginado } from "../componentes/Tabla/Tabla";

function Pedidos() {
  const seccionActual = "Pedidos";
  const opcionesRatio = ["Todos", "Pendientes", "Recibidos"];
  const columnas = [
    " ",
    " ",
    " ",
    " ",
    "id",
    "Estado",
    "Total",
    "Proveedor",
    "Fecha compra",
  ];
  const datos = [["a"], ["a"]];
  return (
    <div className="flex h-screen w-screen text-base flex-row font-lato text-dark-green bg-gradient-to-t from-white-1 to-white-2">
      <MenuLateralProduccion seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-gradient-to-t from-white-1 to-white-2">
        <Header
          perfil="Lautaro Acosta"
          area="Produccion"
          fotoDe="osiris"
        />
        <div className="flex flex-wrap items-center justify-between gap-5">
          <h1>Listado de proveedores</h1>
          <div className="flex gap-[5px] items-center">
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />

            <BtnBuscador buscarPor="Proveedor" estilo="btnBuscadorGeneral" />
            <BtnBuscador buscarPor="ID" estilo="btnBuscador" />
            <BtnRatio opciones={opcionesRatio} />
          </div>
        </div>
        <div className="w-full max-h-[773px] h-fit overflow-y-hidden border border-slate-blue2">
          <TablaEditable4
            columnas={columnas}
            datos={datos}
            icono1="visibility"
            icono2="print"
            icono3="edit"
            icono4="delete"
          />
        </div>
        <div className="flex justify-between">
          <Paginado />
          <div className="flex gap-[8px]">
            <Btn estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Pedidos;
