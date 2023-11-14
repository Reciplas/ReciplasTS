import { MenuLateralProduccion } from "../componentes/MenuLateral";
import { Btn } from "../componentes/Boton";
import Header from "../componentes/Header";
import { AGTable } from "../componentes/AGTable";

function MateriaPrima() {
  const seccionActual = "MP";

  return (
    <div className="flex h-screen w-screen text-[1rem] flex-row font-lato text-dark-green bg-white-5">
      <MenuLateralProduccion seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-white-5">
        <Header perfil="Lautaro Acosta" area="Produccion" fotoDe="osiris" />
        <div className="flex flex-col gap-3 w-[70%]">
          <h1>Ingresos de materia prima</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/materias_primas/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn tipo="button" estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default MateriaPrima;
