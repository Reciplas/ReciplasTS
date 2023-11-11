import { MLventas } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";
import { Link } from "react-router-dom";

function Pedidos() {
  const seccionActual = "Pedidos";
  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <h1>Listado de pedidos</h1>
        </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/pedidos/"} />

        <div className="flex justify-between">
          <div className="flex gap-[8px]">
            <Link to="/Ventas/NuevoPedido" className={"btnImpimir"}>
              <Btn estilo="btnImprimir" valor="Nuevo Pedido" />
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Pedidos;
