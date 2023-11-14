import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Ventas() {
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
          </div>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/ventas/"} />

        <div className="flex justify-between">
          <div className="flex gap-[8px] ">
            <Btn tipo="button" estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Ventas;
