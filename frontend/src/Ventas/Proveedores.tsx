import { MLventas } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Proveedores() {
  const seccionActual = "Proveedores";
  return (
    <div className="flex h-screen w-screen flex-row font-lato bg-white-1">
      <MLventas seccionActual={seccionActual} />
      <div className="bg-white-1 flex basis-0 grow-[999] flex-col min-w-[70%] gap-2.5 px-4  ">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="flex justify-between items-center gap-5 flex-wrap">
          <h1>Listado de proveedores</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/proveedores/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn tipo="button" estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Proveedores;
