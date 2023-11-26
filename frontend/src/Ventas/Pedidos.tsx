import { MLventas } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGPedidos, AGTable } from "../componentes/AGTable";
import { Link } from "react-router-dom";
import { useState } from "react";
import { PopUpExito } from "../componentes/Popup";

function Pedidos() {
  const seccionActual = "Pedidos";
  const [[popUpExito, msj], setPopUpExito] = useState([false, ""]);
  return (
    <div className="App">
      <PopUpExito estado={popUpExito} msj={msj} />
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <h1>Listado de pedidos</h1>
        </div>

        <AGPedidos
          endpointPath={"http://127.0.0.1:8000/api/pedidos/"}
          setPopUpExito={setPopUpExito}
        />

        <div className="flex justify-between">
          <div className="flex gap-[8px]">
            <Link to="/Ventas/NuevoPedido" className={"btnImpimir"}>
              <Btn tipo="button" estilo="btnImprimir" valor="Nuevo Pedido" />
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Pedidos;
