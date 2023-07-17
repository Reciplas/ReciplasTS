import MenuLateral from "../componentes/MenuLateral/MenuLateral";
import "../App.css";
import { BtnBuscador, Btn, Filtro } from "../componentes/Boton/Boton";
import { Paginado, Tabla } from "../componentes/Tabla/Tabla";
import Header from "../componentes/Header/Header";

function MateriaPrima() {
  const seccionActual = "MP";
  const columnas = ["id", "Plástico", "Cantidad(kg)", "Ultimo Cambio"];
  const datos = [
    [, "1", "PS", "79", "12/7/2022"],
    [, "2", "PET", "75", "7/7/2023"],
    [, "3", "READ", "59", "8/30/2022"],
    [, "4", "PP", "20", "1/25/2023"],
    [, "5", "PVC", "28", "9/29/2022"],
    [, "6", "PEBD", "65", "3/27/2023"],
    [, "7", "READ", "91", "3/14/2023"],
    [, "8", "PET", "77", "6/18/2023"],
    [, "9", "PS", "12", "6/7/2023"],
    [, "10", "PEBD", "75", "3/6/2023"],
  ];

  return (
    <div className="App">
      <MenuLateral seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />
        <div className="titulo-principal">
          <h1>Listado de materia prima</h1>
          <div style={{ display: "flex", gap: "5px", alignItems: "center" }}>
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />

            <BtnBuscador buscarPor="ID" estilo="btnBuscador" />
          </div>
        </div>

        <div className="contenedor-tabla">
          <Tabla columnas={columnas} datos={datos} />
        </div>
        <div style={{ display: "flex", justifyContent: "space-between" }}>
          <Paginado />
          <div style={{ display: "flex", gap: "8px" }}>
            <Btn estilo="btnImprimir" valor="Agregar" />
            <Btn estilo="btnImprimir" valor="Gernerar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default MateriaPrima;
