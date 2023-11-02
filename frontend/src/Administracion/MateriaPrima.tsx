import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import { Btn } from "../componentes/Boton";
import Header from "../componentes/Header";
import { AGTable } from "../componentes/AGTable";

function MateriaPrima() {
  const seccionActual = "MP";

  return (
    <div className="App">
      <MenuLateral seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header
          perfil="Tobias Stegmayer"
          area="Administracion"
          fotoDe="canela"
        />

        <div className="flex flex-col gap-3 w-[70%]">
          <h1>Ingresos de materia prima</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/materias_primas/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Generar Informe" />
            <Btn estilo="btnImprimir" valor="Agregar" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default MateriaPrima;
