import { MenuLateralProduccion } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import {
  Btn,
  BtnRatio,
  BtnBuscador,
  BtnPopUp,
  BtnPopUpPeriodo,
} from "../componentes/Boton";
import { TablaEditable4, Paginado } from "../componentes/Tabla";

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
  const datos = [
    [
      "1",
      "Recibido",
      "$14.159,56",
      "Cormier, Connelly and Osinski",
      "1/27/2023",
    ],
    ["2", "Recibido", "$11.338,48", "Gutmann-Beahan", "5/27/2023"],
    [
      "3",
      "Pendiente",
      "$45.475,93",
      "Rempel, Franecki and Spinka",
      "8/11/2022",
    ],
    ["4", "Recibido", "$51.023,68", "Ruecker LLC", "2/15/2023"],
    ["5", "Pendiente", "$58.680,81", "Spinka Group", "3/21/2023"],
    ["6", "Recibido", "$97.492,29", "Brown-Kuphal", "3/29/2023"],
    ["7", "Recibido", "$46.618,63", "Lehner-Turcotte", "9/7/2022"],
    ["8", "Pendiente", "$61.793,37", "Kunze, Daugherty and Moen", "10/26/2022"],
    ["9", "Pendiente", "$62.467,06", "Gibson-Jaskolski", "8/20/2022"],
    ["10", "Recibido", "$21.323,50", "Johnson, Adams and Ullrich", "12/2/2022"],
    ["11", "Recibido", "$48.909,39", "Cruickshank and Sons", "7/28/2022"],
    [
      "12",
      "Recibido",
      "$90.642,35",
      "Herman, Streich and Kreiger",
      "12/4/2022",
    ],
    ["13", "Pendiente", "$92.822,95", "Howell-Kozey", "12/28/2022"],
    ["14", "Pendiente", "$93.398,70", "Adams-Schimmel", "1/26/2023"],
    ["15", "Recibido", "$86.190,39", "Willms Group", "12/13/2022"],
  ];
  return (
    <div className="flex h-screen w-screen text-[1rem] flex-row font-lato text-dark-green bg-gradient-120 from-white-1 to-white-2">
      <MenuLateralProduccion seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-gradient-120 from-white-1 to-white-2">
        <Header perfil="Lautaro Acosta" area="Produccion" fotoDe="osiris" />
        <div className="flex flex-wrap items-center justify-between gap-5">
          <h1>Listado de pedidos</h1>
          <div className="flex gap-[5px] items-center">
            <BtnPopUp
              estilo="btnOrdenar"
              valor="Ordenar"
              items={["Fecha", "ID", "Precio"]}
            />
            <BtnPopUpPeriodo estilo="btnOrdenar" valor="Filtrar Período" />

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