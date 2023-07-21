import { useState } from "react";
import "../App.css";
import { Tabla, Paginado } from "../componentes/Tabla";
import Header from "../componentes/Header";
import { MenuLateral } from "../componentes/MenuLateral";
import { BtnBuscador, Btn, Filtro } from "../componentes/Boton";

function Compras() {
  const columnas = [
    "id",
    "Plástico",
    "Precio",
    "Cantidad(kg)",
    "Descripción",
    "Fecha de ingreso",
  ];
  const datos = [
    [
      ,
      "1",
      "PEBD",
      "$3428.47",
      "32",
      "Caja de plástico para organización de objetos",
      "3/28/2023",
    ],
    [
      ,
      "2",
      "PS",
      "$7669.93",
      "11",
      "Cubiertos desechables de plástico resistente",
      "7/19/2022",
    ],
    [
      ,
      "3",
      "PS",
      "$19095.23",
      "86",
      "Envase de plástico para productos químicos",
      "2/11/2023",
    ],
    [
      ,
      "4",
      "PET",
      "$16549.40",
      "34",
      "Recipiente hermético de plástico para almacenamiento",
      "1/12/2023",
    ],
    [
      ,
      "5",
      "PEBD",
      "$11231.31",
      "78",
      "Envase de plástico para productos químicos",
      "5/25/2023",
    ],
    [
      ,
      "6",
      "PVC",
      "$24527.00",
      "6",
      "Vaso de plástico transparente reutilizable 250ml",
      "8/29/2022",
    ],
    [
      ,
      "7",
      "PET",
      "$20855.78",
      "98",
      "Bolsa de plástico transparente con cierre tipo zipper",
      "7/1/2023",
    ],
    [
      ,
      "8",
      "PP",
      "$14847.65",
      "84",
      "Botella de plástico con pulverizador",
      "11/29/2022",
    ],
    [
      ,
      "9",
      "PEBD",
      "$6196.46",
      "75",
      "Tapón de rosca para botella PET",
      "8/25/2022",
    ],
    [
      ,
      "10",
      "PS",
      "$24429.73",
      "72",
      "Tapón de rosca para botella PET",
      "3/4/2023",
    ],
  ];
  const itemsList = ["Plástico", "PET", "READ", "PVC", "PEBD", "PP", "PS"];

  const [opcionSeleccionada, setOpcionSeleccionada] = useState("");

  const [inputValue, setInputValue] = useState(itemsList[0]);

  const handleOptionChange = (event: any) => {
    const selectedValue = event.target.value;
    setOpcionSeleccionada(selectedValue);
    setInputValue(selectedValue);
  };

  const handleInputChange = () => {
    const selectedValue = "";
    setInputValue(selectedValue);
  };

  return (
    <div className="App">
      <MenuLateral seccionActual="Compras" />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />
        <div className="titulo-principal">
          <h1>Listado de materia prima ingresada</h1>
          <div style={{ display: "flex", gap: "5px", alignItems: "center" }}>
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />
            <Filtro
              estilo="btnFiltro"
              items={itemsList}
              opcionSeleccionada={opcionSeleccionada}
              retornarOpcion={handleOptionChange}
            />
            <BtnBuscador
              buscarPor="ID"
              estilo="btnBuscador"
              // inputChange = {handleInputChange}
            />
          </div>
        </div>

        <div className="contenedor-tabla">
          <Tabla columnas={columnas} datos={datos} estilo={""} />
        </div>
        <div style={{ display: "flex", justifyContent: "space-between" }}>
          <Paginado />
          <div style={{ display: "flex", gap: "8px" }}>
            <Btn estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Compras;
