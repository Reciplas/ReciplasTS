import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Clientes() {
  const seccionActual = "Clientes";
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
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/clientes/"} />

        <div className="flex justify-between">
          <div className="flex gap-[8px]">
            <Btn tipo="button" estilo="btnImprimir" valor="Añadir Cliente" />
            <Btn tipo="button" estilo="btnImprimir" valor="Gernerar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Clientes;
