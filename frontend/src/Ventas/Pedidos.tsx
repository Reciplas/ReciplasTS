import { MLventas } from "../componentes/MenuLateral";
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
  const opcionesRatio = ["Todos", "Pendientes", "Frabricación", "Entrega"];
  const columnas = [
    " ",
    " ",
    " ",
    " ",
    "id",
    "Estado",
    "Total",
    "Cliente",
    "Fecha compra",
  ];
  const datos = [
    ["1", "Recibido", "$83028.16", "Kathryne Pilch", "3/14/2023"],
    ["2", "Recibido", "$89215.72", "Marcile Ibbott", "2/4/2023"],
    ["3", "Entrega", "$46209.58", "Joshua McKerrow", "4/20/2023"],
    ["4", "Fabricación", "$93202.81", "Chloette Fullman", "7/8/2023"],
    ["5", "Recibido", "$50367.89", "Horst Pennazzi", "11/25/2022"],
    ["6", "Fabricación", "$18361.14", "Thaxter Tortis", "12/11/2022"],
    ["7", "Recibido", "$64052.14", "Letty Stickel", "8/3/2022"],
    ["8", "Entrega", "$62911.05", "Nathaniel Spincke", "5/18/2023"],
    ["9", "Fabricación", "$84390.27", "Chevy Thorneley", "5/29/2023"],
    ["10", "Fabricación", "$35398.32", "Carney Chamney", "10/1/2022"],
  ];
  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <h1>Listado de pedidos</h1>
          <div className="flex gap-[5px] items-center">
            <BtnPopUp
              estilo="btnOrdenar"
              valor="Ordenar"
              items={["Fecha", "ID", "Total"]}
            />
            <BtnPopUpPeriodo estilo="btnOrdenar" valor="Filtrar Período" />

            <BtnBuscador buscarPor="Cliente" estilo="btnBuscadorGeneral" />
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
