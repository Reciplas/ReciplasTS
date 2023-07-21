import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import { useState } from "react";
import Header from "../componentes/Header";
import { Btn, Filtro, BtnBuscador } from "../componentes/Boton";
import { TablaEditable, Paginado } from "../componentes/Tabla";

function Usuarios() {
  const seccionActual = "Usuarios";
  const itemsList = ["Área", "Admin.", "Ventas", "Compras", "Producción"];
  const columnas = [
    " ",
    " ",
    "id",
    "Nombre",
    "Área",
    "Telefono",
    "Email",
    "Dirección",
    "Fecha de ingreso",
  ];
  const datos = [
    [
      "1",
      "Anabal Asquez",
      "Compras",
      "262 507 1624",
      "aasquez0@google.com.hk",
      "6535 Weeping Birch Circle",
      "7/18/2022",
    ],
    [
      "2",
      "Zorah Igo",
      "Administración",
      "149 199 8308",
      "zigo1@usa.gov",
      "3 Dawn Plaza",
      "6/13/2023",
    ],
    [
      "3",
      "Fin Mourant",
      "Administración",
      "288 393 4482",
      "fmourant2@wix.com",
      "78 Michigan Crossing",
      "4/12/2023",
    ],
    [
      "4",
      "Rodina Bradnocke",
      "Compras",
      "705 252 5569",
      "rbradnocke3@msn.com",
      "88 Manitowish Court",
      "4/18/2023",
    ],
    [
      "5",
      "Elle Capelle",
      "Producción",
      "559 532 2298",
      "ecapelle4@eventbrite.com",
      "9108 Moose Circle",
      "10/17/2022",
    ],
    [
      "6",
      "Traver Kynoch",
      "Administración",
      "351 263 8608",
      "tkynoch5@youtu.be",
      "829 Forster Way",
      "12/22/2022",
    ],
    [
      "7",
      "Lindi Jedrychowski",
      "Compras",
      "501 177 8531",
      "ljedrychowski6@unc.edu",
      "61 Sloan Pass",
      "6/13/2023",
    ],
    [
      "8",
      "Hale Monshall",
      "Administración",
      "528 114 4557",
      "hmonshall7@senate.gov",
      "023 Bashford Park",
      "9/13/2022",
    ],
    [
      "9",
      "Gypsy Searight",
      "Administración",
      "486 735 8605",
      "gsearight8@icq.com",
      "17977 Bashford Crossing",
      "5/21/2023",
    ],
    [
      "10",
      "Hoebart Cullinan",
      "Ventas",
      "134 619 8690",
      "hcullinan9@tinyurl.com",
      "66179 Redwing Avenue",
      "11/9/2022",
    ],
  ];
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
      <MenuLateral seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />
        <div className="titulo-principal">
          <h1>Listado de usuarios</h1>
          <div className="flex gap-[5px] items-center">
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />
            <Filtro
              estilo="btnFiltro"
              items={itemsList}
              opcionSeleccionada={opcionSeleccionada}
              retornarOpcion={handleOptionChange}
            />
            <BtnBuscador buscarPor="Nombre" estilo="btnBuscadorGeneral" />
            <BtnBuscador buscarPor="ID" estilo="btnBuscador" />
          </div>
        </div>
        <div className="contenedor-tabla">
          <TablaEditable
            columnas={columnas}
            datos={datos}
            icono1="edit"
            icono2="delete"
          />
        </div>
        <div className="flex justify-between">
          <Paginado />
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Nuevo Usuario" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Usuarios;
