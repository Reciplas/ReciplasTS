import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import {
  BtnBuscador,
  Btn,
  Filtro,
  BtnPopUp,
  BtnPopUpPeriodo,
} from "../componentes/Boton";
import { useState } from "react";
import { Paginado, Tabla } from "../componentes/Tabla";
import Header from "../componentes/Header";

function MateriaPrima() {
  const seccionActual = "MP";

  const columnasStock = ["Plástico", "Cantidad(kg)", "Ultimo Cambio"];
  const datosStock = [
    ["PS", "79", "12/7/2022"],
    ["PP", "20", "1/25/2023"],
    ["PVC", "28", "9/29/2022"],
    ["PEBD", "65", "3/27/2023"],
    ["READ", "91", "3/14/2023"],
    ["PET", "77", "6/18/2023"],
  ];

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

  const [opcionSeleccionada2, setOpcionSeleccionada2] = useState("");

  const [inputValue, setInputValue] = useState(itemsList[0]);

  const handleOptionChange = (event: any) => {
    const selectedValue = event.target.value;
    setOpcionSeleccionada(selectedValue);
    setInputValue(selectedValue);
  };

  const handleOptionChange2 = (event: any) => {
    const selectedValue = event.target.value;
    setOpcionSeleccionada2(selectedValue);
    setInputValue(selectedValue);
  };

  const handleInputChange = () => {
    const selectedValue = "";
    setInputValue(selectedValue);
  };

  return (
    <div className="App">
      <MenuLateral seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />

        <div className="flex gap-[10px] w-[100%]">
          <div className="flex flex-col gap-3 w-[70%]">
            <h1>Ingresos de materia prima</h1>
            <div className="flex gap-[5px] items-center">
              <BtnPopUp
                estilo="btnOrdenar"
                valor="Ordenar"
                items={["Fecha", "ID", "Precio", "Cantidad"]}
              />
              <BtnPopUpPeriodo estilo="btnOrdenar" valor="Filtrar Período" />
              <Filtro
                estilo="btnFiltro"
                items={itemsList}
                opcionSeleccionada={opcionSeleccionada}
                retornarOpcion={handleOptionChange}
              />
              <BtnBuscador buscarPor="ID" estilo="btnBuscador" />
            </div>
            <div className="contenedor-tabla">
              <Tabla columnas={columnas} datos={datos} estilo={""} />
            </div>
            <div className="flex justify-between">
              <Paginado />
              <div className="flex gap-2">
                <Btn estilo="btnImprimir" valor="Generar Informe" />
              </div>
            </div>
          </div>

          <div className="flex flex-col w-[30%] gap-3">
            <h1>Stock de materia prima</h1>
            <div className="flex gap-1 items-center">
              <BtnPopUp
                estilo="btnOrdenar"
                valor="Ordenar"
                items={["Fecha", "Cantidad"]}
              />
              <Filtro
                estilo="btnFiltro"
                items={itemsList}
                opcionSeleccionada={opcionSeleccionada2}
                retornarOpcion={handleOptionChange2}
              />
            </div>
            <div className="contenedor-tabla">
              <Tabla
                columnas={columnasStock}
                datos={datosStock}
                estilo="tablaChiquita"
              />
            </div>
            <div className="flex flex-wrap gap-2 justify-start">
              {/* <Paginado/> */}
              <div className="flex gap-2 flex-wrap">
                <Btn estilo="btnImprimir" valor="Agregar" />
                <Btn estilo="btnImprimir" valor="Gernerar Informe" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default MateriaPrima;
