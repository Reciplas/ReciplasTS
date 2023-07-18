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
  const datos = [["a"], ["a"]];
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
