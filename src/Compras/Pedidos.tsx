import { MLcompras } from "../componentes/MenuLateral/MenuLateral";
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
  const datos = [
    [
      "1",
      "Recibido",
      "$14159.56",
      "Cormier, Connelly and Osinski",
      "1/27/2023",
    ],
    ["2", "Recibido", "$11338.48", "Gutmann-Beahan", "5/27/2023"],
    ["3", "Pendiente", "$45475.93", "Rempel, Franecki and Spinka", "8/11/2022"],
    ["4", "Recibido", "$51023.68", "Ruecker LLC", "2/15/2023"],
    ["5", "Pendiente", "$58680.81", "Spinka Group", "3/21/2023"],
    ["6", "Recibido", "$97492.29", "Brown-Kuphal", "3/29/2023"],
    ["7", "Recibido", "$46618.63", "Lehner-Turcotte", "9/7/2022"],
    ["8", "Pendiente", "$61793.37", "Kunze, Daugherty and Moen", "10/26/2022"],
    ["9", "Pendiente", "$62467.06", "Gibson-Jaskolski", "8/20/2022"],
    ["10", "Recibido", "$21323.50", "Johnson, Adams and Ullrich", "12/2/2022"],
    ["11", "Recibido", "$48909.39", "Cruickshank and Sons", "7/28/2022"],
    ["12", "Recibido", "$90642.35", "Herman, Streich and Kreiger", "12/4/2022"],
    ["13", "Pendiente", "$92822.95", "Howell-Kozey", "12/28/2022"],
    ["14", "Pendiente", "$93398.70", "Adams-Schimmel", "1/26/2023"],
    ["15", "Recibido", "$86190.39", "Willms Group", "12/13/2022"],
  ];
  return (
    <div className="App">
      <MLcompras seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />
        <div className="titulo-principal">
          <h1>Listado de proveedores</h1>
          <div className="flex gap-[5px] items-center">
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />

            <BtnBuscador buscarPor="Proveedor" estilo="btnBuscadorGeneral" />
            <BtnBuscador buscarPor="ID" estilo="btnBuscador" />
            <BtnRatio opciones={opcionesRatio} />
          </div>
        </div>
        <div className="contenedor-tabla">
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
