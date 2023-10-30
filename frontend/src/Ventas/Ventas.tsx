import { MLventas } from "../componentes/MenuLateral";
import "../App.css";
import { Paginado, TablaEditable } from "../componentes/Tabla";
import Header from "../componentes/Header";
import {
  BtnBuscador,
  Btn,
  BtnPopUp,
  BtnPopUpCuotas,
  BtnPopUpPeriodo,
  BtnPopUpTotal,
} from "../componentes/Boton";

function Ventas() {
  const columnas = [" ", " ", "id", "Total", "Cuotas", "Cliente", "Fecha"];
  const datos = [
    [, "1", "$81534.07", "1/4", "Amber Shutte", "5/30/2023"],
    [, "2", "$73725.44", "7/12", "Gallagher Flaxman", "12/22/2022"],
    [, "3", "$34364.07", "9/12", "Hetty Blindermann", "5/11/2023"],
    [, "4", "$14791.35", "1/6", "Samson Bearfoot", "10/13/2022"],
    [, "5", "$54455.75", "3/6", "Michael Reppaport", "10/21/2022"],
    [, "6", "$4601.90", "3/6", "Dwain Forcade", "9/25/2022"],
    [, "7", "$53315.07", "1/6", "Lydon Quinney", "4/7/2023"],
    [, "8", "$75710.02", "3/9", "Barde Lambshine", "3/3/2023"],
    [, "9", "$38070.24", "3/9", "Karola Matignon", "12/13/2022"],
    [, "10", "$44056.87", "9/9", "Hildegarde Mellon", "11/3/2022"],
  ];

  const seccionActual = "Ventas";
  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <h1>Listado de ventas</h1>
          <div className="flex gap-[5px] items-center">
            <BtnPopUp
              estilo="btnOrdenar"
              valor="Ordenar"
              items={["Fecha", "ID", "Total"]}
            />
            <BtnPopUpPeriodo estilo="btnOrdenar" valor="Filtrar Período" />
            <BtnPopUpTotal estilo="btnOrdenar" valor="Filtrar Total" />
            <BtnPopUpCuotas estilo="btnOrdenar" valor="Cuotas" />

            <BtnBuscador
              buscarPor="Buscar Nro o Cliente"
              estilo=" btnBuscadorGeneral"
            />
          </div>
        </div>
        <div className="contenedor-tabla">
          <TablaEditable
            columnas={columnas}
            datos={datos}
            icono1="visibility"
            icono2="print"
          />
        </div>
        <div className="flex justify-between">
          <Paginado />
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Nueva Venta" />
            <Btn estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Ventas;
