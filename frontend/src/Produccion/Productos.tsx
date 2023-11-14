import { MenuLateralProduccion } from "../componentes/MenuLateral";
import "../App.css";
import { Btn } from "../componentes/Boton";
import Header from "../componentes/Header";
import { AGTable } from "../componentes/AGTable";

function Productos() {
  const seccionActual = "Productos";

  return (
    <div className="flex h-screen w-screen text-[1rem] flex-row font-lato text-dark-green bg-gradient-120 from-white-1 to-white-2">
      <MenuLateralProduccion seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-gradient-120 from-white-1 to-white-2">
        <Header perfil="Lautaro Acosta" area="Produccion" fotoDe="osiris" />
        <div className="flex flex-wrap items-center justify-between gap-5">
          <h1>Listado de productos</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/productos/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn tipo="button" estilo="btnImprimir" valor="Agregar" />
            <Btn tipo="button" estilo="btnImprimir" valor="Gernerar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Productos;
