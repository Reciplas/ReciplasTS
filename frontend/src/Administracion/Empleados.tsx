import { MenuLateral } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Empleados() {
  const seccionActual = "Empleados";
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
          <h1>Listado de Empleados</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/empleados/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn tipo="button" estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Empleados;
