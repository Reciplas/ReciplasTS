import { MLcompras } from "../componentes/MenuLateral";
import "../App.css";
import { Btn } from "../componentes/Boton";
import Header from "../componentes/Header";
import { AGTable } from "../componentes/AGTable";

function MateriaPrima() {
  const seccionActual = "MP";

  return (
    <div className="flex h-screen w-screen text-[1rem] flex-row font-lato text-dark-green bg-gradient-120 from-white-1 to-white-2">
      <MLcompras seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-gradient-120 from-white-1 to-white-2">
        <Header perfil="Enzo Nahuel Vallejos" area="Compras" fotoDe="enzo" />

        <div className="flex flex-col gap-[10px] w-[70%]">
          <h1>Ingresos de materia prima</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/materias_primas/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Añadir ingresos" />
            <Btn estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default MateriaPrima;
