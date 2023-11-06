import { MLcompras } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Pedidos() {
  const seccionActual = "Pedidos";

  return (
    <div className="App">
      <MLcompras seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Enzo Nahuel Vallejos" area="Compras" fotoDe="enzo" />
        <div className="titulo-principal">
          <h1>Listado de pedidos</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/pedidos/"} />

        <div className="flex justify-between">
          <div className="flex gap-[8px]">
            <Btn estilo="btnImprimir" valor="Añadir Proveedor" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Pedidos;
