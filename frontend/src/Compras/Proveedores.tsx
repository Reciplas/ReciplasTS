import { MLcompras } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Proveedores() {
  const seccionActual = "Proveedores";

  return (
    <div className="flex h-screen w-screen text-[1rem] flex-row font-lato text-dark-green bg-gradient-120 from-white-1 to-white-2">
      <MLcompras seccionActual={seccionActual} />
      <div className="flex flex-col basis-0 grow-[999] min-w-[70%] gap-3 py-0 px-4 bg-gradient-120 from-white-1 to-white-2">
        <Header perfil="Enzo Nahuel Vallejos" area="Compras" fotoDe="enzo" />
        <div className="flex flex-wrap items-center justify-between gap-5">
          <h1>Listado de proveedores</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/proveedores/"} />

        <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Proveedores;
