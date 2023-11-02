import {MenuLateral} from "../componentes/MenuLateral";
import "../App.css";
import {Btn} from "../componentes/Boton";
import Header from "../componentes/Header";
import { AGTable } from "../componentes/AGTable";

// TODO:
// 1) Varios cambios obvios son la flexibilidad (Argumentos) que le tengamos que proporcionar a AGTable para representar más tipos de tablas, con distintos datos.

function Productos() {
    const seccionActual = "Productos";
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
                    <h1>Listado de productos</h1>
                </div>

                <AGTable endpointPath={"http://127.0.0.1:8000/api/productos/"}/>

                <div className="flex justify-between">
                    <div className="flex gap-2">
                        <Btn estilo="btnImprimir" valor="Agregar" />
                        <Btn estilo="btnImprimir" valor="Generar Informe" />
                    </div>
                </div>
            </div>
        </div>
  );
}

export default Productos;
