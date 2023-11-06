import { MLventas } from "../componentes/MenuLateral";
import "../App.css";
import Header from "../componentes/Header";
import { Btn } from "../componentes/Boton";
import { AGTable } from "../componentes/AGTable";

function Ventas() {
  const seccionActual = "Ventas";

  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <h1>Listado de ventas</h1>
       </div>

        <AGTable endpointPath={"http://127.0.0.1:8000/api/ventas/"} />

       <div className="flex justify-between">
          <div className="flex gap-2">
            <Btn estilo="btnImprimir" valor="Nueva Venta" />
            <Btn estilo="btnImprimir" valor="Generar Informe" />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Ventas;
