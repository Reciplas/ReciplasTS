import { MenuLateral } from "../componentes/MenuLateral";
import { Detalle } from "../componentes/Detalles";
import "../App.css";
import { Paginado, TablaEditable } from "../componentes/Tabla";
import Header from "../componentes/Header";
import {
  BtnBuscador,
  Btn,
  BtnPopUp,
  BtnPopUpPeriodo,
  BtnPopUpTotal,
  BtnPopUpCuotas,
} from "../componentes/Boton";

function Ventas() {
  const columnas = [" ", " ", "id", "Total", "Cuotas", "Cliente", "Fecha"];
  const datos = [
    [, "1", "$81.534,07", "1/4", "Amber Shutte", "5/30/2023"],
    [, "2", "$73.725,44", "7/12", "Gallagher Flaxman", "12/22/2022"],
    [, "3", "$34.364,07", "9/12", "Hetty Blindermann", "5/11/2023"],
    [, "4", "$14.791,35", "1/6", "Samson Bearfoot", "10/13/2022"],
    [, "5", "$54.455,75", "3/6", "Michael Reppaport", "10/21/2022"],
    [, "6", "$4.601,90", "3/6", "Dwain Forcade", "9/25/2022"],
    [, "7", "$53.315,07", "1/6", "Lydon Quinney", "4/7/2023"],
    [, "8", "$75.710,02", "3/9", "Barde Lambshine", "3/3/2023"],
    [, "9", "$38.070,24", "3/9", "Karola Matignon", "12/13/2022"],
    [, "10", "$44.056,87", "9/9", "Hildegarde Mellon", "11/3/2022"],
  ];

  const seccionActual = "Ventas";

  return (
    <div className="App">
      <MenuLateral seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />
        <div className="flex gap-[10px] w-[100%] flex-row">
          <div className="flex flex-col gap-3 w-[70%]">
            <h1>Listado de ventas</h1>
            <div className="flex gap-[5px] items-center flex-wrap ">
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
              <div className="flex gap-[8px] ">
                <Btn estilo="btnImprimir" valor="Generar Informe" />
              </div>
            </div>
          </div>

          <div className="flex flex-col w-[30%] gap-[10px] ">
            <h1> Detalle </h1>
            <Detalle />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Ventas;
