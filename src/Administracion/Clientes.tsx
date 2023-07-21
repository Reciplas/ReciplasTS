import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import {
  Btn,
  Filtro,
  BtnBuscador,
  BtnPopUp,
  BtnPopUpPeriodo,
} from "../componentes/Boton";
import { TablaEditable, Paginado } from "../componentes/Tabla";

function Clientes() {
  const seccionActual = "Clientes";
  const columnas = [
    " ",
    " ",
    "id",
    "Nombre",
    "Telefono",
    "Email",
    "Dirección",
    "Fecha de registro",
  ];
  const datos = [
    [
      "1",
      "Broderic Thornton",
      "955 651 7054",
      "bthornton0@tinyurl.com",
      "2137 Lien Lane",
      "7/14/2022",
    ],
    [
      "2",
      "Grantley Darville",
      "723 414 1591",
      "gdarville1@nps.gov",
      "021 Knutson Plaza",
      "8/13/2022",
    ],
    [
      "3",
      "Brandy MacKniely",
      "141 355 6533",
      "bmackniely2@washingtonpost.com",
      "3 Barby Pass",
      "8/17/2022",
    ],
    [
      "4",
      "Donna Forcer",
      "590 492 5301",
      "dforcer3@forbes.com",
      "90 Brown Drive",
      "1/15/2023",
    ],
    [
      "5",
      "Philbert Simoneau",
      "450 735 4235",
      "psimoneau4@bandcamp.com",
      "9 Eastwood Center",
      "4/7/2023",
    ],
    [
      "6",
      "Alejoa MacCoughen",
      "657 586 9955",
      "amaccoughen5@goo.gl",
      "8313 Buell Alley",
      "4/4/2023",
    ],
    [
      "7",
      "Indira Drinnan",
      "821 734 0478",
      "idrinnan6@cisco.com",
      "7617 Anderson Hill",
      "4/14/2023",
    ],
    [
      "8",
      "Joanne Goodley",
      "418 525 9862",
      "jgoodley7@state.tx.us",
      "6595 Schmedeman Hill",
      "2/9/2023",
    ],
    [
      "9",
      "Jeanna Barbery",
      "502 849 6461",
      "jbarbery8@bizjournals.com",
      "76620 Hayes Way",
      "8/12/2022",
    ],
    [
      "10",
      "Roxana Luttgert",
      "156 436 6339",
      "rluttgert9@gravatar.com",
      "569 American Court",
      "4/20/2023",
    ],
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
          <h1>Listado de clientes</h1>
          <div className="flex gap-[5px] items-center">
            <BtnPopUp
              estilo="btnOrdenar"
              valor="Ordenar"
              items={["Fecha", "ID"]}
            />
            <BtnPopUpPeriodo estilo="btnOrdenar" valor="Filtrar Período" />
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
          <div className="flex gap-[8px]">
            <Btn estilo="btnImprimir" valor="Añadir Cliente" />
            <Btn estilo="btnImprimir" valor="Gernerar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Clientes;
