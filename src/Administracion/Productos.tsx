import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import { BtnBuscador, Btn, Filtro } from "../componentes/Boton";
import { Paginado, TablaEditable } from "../componentes/Tabla";
import Header from "../componentes/Header";

function Productos() {
  const seccionActual = "Productos";
  const columnas = [
    " ",
    " ",
    "id",
    "Producto",
    "Cantidad(kg)",
    "Descripción",
    "Ultimo Cambio",
  ];
  const datos = [
    ["1", "Paraguas", "20", "Morbi ut odio.", "6/23/2023"],
    ["2", "Mesa", "24", "In eleifend quam a odio.", "4/21/2023"],
    [
      "3",
      "Mesa",
      "48",
      "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      "3/1/2023",
    ],
    [
      "4",
      "Zapatillas",
      "59",
      "Sed vel enim sit amet nunc viverra dapibus.",
      "2/25/2023",
    ],
    [
      "5",
      "Lampara",
      "17",
      "Vivamus in felis eu sapien cursus vestibulum.",
      "2/11/2023",
    ],
    ["6", "Mesa", "27", "Integer non velit.", "7/1/2023"],
    [
      "7",
      "Lampara",
      "51",
      "Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.",
      "3/13/2023",
    ],
    [
      "8",
      "Mesa",
      "42",
      "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.",
      "3/6/2023",
    ],
    ["9", "Anteojos", "15", "Sed accumsan felis.", "8/31/2022"],
    ["10", "Silla", "44", "Proin eu mi.", "5/27/2023"],
  ];
  const itemsList = [
    "Producto",
    "Paraguas",
    "Anteojos",
    "Camiseta",
    "Pantalon",
    "Zapatillas",
    "Silla",
    "Mesa",
    "Lampara",
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
          <h1>Listado de productos</h1>
          <div style={{ display: "flex", gap: "5px", alignItems: "center" }}>
            <Btn estilo="btnOrdenar" valor="Ordenar" />
            <Btn estilo="btnOrdenar" valor="Filtrar Período" />
            <Filtro
              estilo="btnFiltro"
              items={itemsList}
              retornarOpcion={() => {}}
              opcionSeleccionada=""
            />

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

export default Productos;
