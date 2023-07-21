import { MLcompras } from "../componentes/MenuLateral";
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

function Proveedores() {
  const seccionActual = "Proveedores";
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
      "PowerShares DWA Financial Momentum Portfolio",
      "548 746 0471",
      "tjacquet0@goo.ne.jp",
      "38523 Everett Park",
      "8/20/2022",
    ],
    [
      "2",
      "Horizon Technology Finance Corporation",
      "574 997 3363",
      "jenion1@fotki.com",
      "24590 Becker Park",
      "11/23/2022",
    ],
    [
      "3",
      "Vedanta  Limited",
      "661 644 9412",
      "estukings2@cnet.com",
      "97 Del Mar Junction",
      "10/8/2022",
    ],
    [
      "4",
      "BOK Financial Corporation",
      "426 562 7304",
      "stourot3@google.com",
      "8585 Becker Crossing",
      "3/24/2023",
    ],
    [
      "5",
      "Pioneer Power Solutions, Inc.",
      "897 256 1607",
      "smaber4@about.me",
      "9471 Summerview Crossing",
      "8/1/2022",
    ],
    [
      "6",
      "FLIR Systems, Inc.",
      "977 983 3621",
      "emerton5@globo.com",
      "20138 Red Cloud Road",
      "2/26/2023",
    ],
    [
      "7",
      "Overstock.com, Inc.",
      "631 335 0767",
      "calthorp6@vistaprint.com",
      "962 Eliot Place",
      "12/12/2022",
    ],
    [
      "8",
      "FlexShopper, Inc.",
      "867 434 6549",
      "lmore7@chronoengine.com",
      "01 Mcguire Parkway",
      "8/23/2022",
    ],
    [
      "9",
      "Gaming and Leisure Properties, Inc.",
      "511 904 1711",
      "dchicotti8@ebay.com",
      "01440 Service Street",
      "5/20/2023",
    ],
    [
      "10",
      "Blackrock Municipal Income Quality Trust",
      "524 645 2207",
      "ksmorthwaite9@ning.com",
      "586 Trailsway Street",
      "4/30/2023",
    ],
    [
      "11",
      "Eyegate Pharmaceuticals, Inc.",
      "804 486 1729",
      "lmabbota@angelfire.com",
      "3 Shoshone Street",
      "10/10/2022",
    ],
    [
      "12",
      "Inphi Corporation",
      "550 482 6992",
      "cliddingtonb@nasa.gov",
      "98 Burrows Hill",
      "11/23/2022",
    ],
    [
      "13",
      "First Horizon National Corporation",
      "915 429 4838",
      "zmackennyc@ed.gov",
      "86725 Scoville Parkway",
      "6/1/2023",
    ],
    [
      "14",
      "Wheeler Real Estate Investment Trust, Inc.",
      "753 501 8219",
      "aprued@census.gov",
      "31 Brentwood Place",
      "1/18/2023",
    ],
    [
      "15",
      "Dividend and Income Fund",
      "142 972 6761",
      "aboughtone@hexun.com",
      "63 Redwing Avenue",
      "9/30/2022",
    ],
    [
      "16",
      "First Trust Large Cap Value AlphaDEX Fund",
      "161 429 5018",
      "acrudgingtonf@sbwire.com",
      "3 Troy Court",
      "7/11/2022",
    ],
    [
      "17",
      "Fossil Group, Inc.",
      "623 449 4108",
      "bdorking@columbia.edu",
      "3267 Center Trail",
      "8/7/2022",
    ],
    [
      "18",
      "Cotiviti Holdings, Inc.",
      "766 330 0368",
      "gfidlerh@scribd.com",
      "17 Brown Court",
      "2/24/2023",
    ],
    [
      "19",
      "Urban One, Inc. ",
      "319 896 1095",
      "ewardeli@yellowbook.com",
      "64 Dryden Plaza",
      "6/17/2023",
    ],
    [
      "20",
      "Blackrock MuniYield Quality Fund II, Inc.",
      "182 604 5822",
      "mburchallj@mayoclinic.com",
      "9 Birchwood Point",
      "3/18/2023",
    ],
  ];
  return (
    <div className="App">
      <MLcompras seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Enzo Nahuel Vallejos" area="Compras" fotoDe="enzo" />
        <div className="titulo-principal">
          <h1>Listado de proveedores</h1>
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
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Proveedores;
