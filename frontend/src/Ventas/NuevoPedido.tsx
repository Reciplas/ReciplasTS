import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MLventas } from "../componentes/MenuLateral";
import { Link } from "react-router-dom";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";
import { AGCliente, AGTable, AGProducto } from "../componentes/AGTable";

function NuevoPedido() {
  const seccionActual = "Pedidos";
  return (
    <div className="App">
      <MLventas seccionActual={seccionActual} />
      <div className="contenedor-principal">
        <Header perfil="Tomas Gúzman" area="Ventas" fotoDe="canelaTriste" />
        <div className="titulo-principal">
          <div className="flex">
            <Link to="/Ventas/Pedidos">
              <h1>Pedido</h1>
            </Link>
            <h1>/Nuevo Pedido</h1>
          </div>
        </div>

        <form method="Post">
          <div className="flex flex-col gap-[20px]">
            <div className="flex flex-col gap-[10px]">
              <Label texto="Cliente" estilo="" />
              <AGCliente endpointPath={"http://127.0.0.1:8000/api/clientes/"} />
            </div>
            <div className="flex flex-col gap-[10px] ">
              <Label texto="Formulario de Pedido" estilo="" />
              <AGProducto
                endpointPath={"http://127.0.0.1:8000/api/productos/"}
              />
            </div>

            {/* <div className="flex flex-wrap gap-[30px] h-fit">
              <div className=" p-[10px] flex flex-col gap-[20px]">
                <div className="flex flex-wrap gap-[20px]">
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Provincia" />
                    <InputTypeText texto="Chaco" />
                  </div>
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Ciudad" />
                    <InputTypeText texto="Charata" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="Calle" />
                    <InputTypeText texto="Chiclana" />
                  </div>
                  <div className=" h-fit w-[100px] ">
                    <LabelObligatorio texto="Nro" />
                    <InputTypeText texto="2135" />
                  </div>
                  <div className=" h-fit w-[100px] ">
                    <Label texto="Piso" estilo="h-[30px] " />
                    <InputTypeText texto="-" />
                  </div>
                  <div className=" h-fit w-[100px] ">
                    <Label texto="Dept." estilo="h-[30px] " />
                    <InputTypeText texto="-" />
                  </div>
                </div>
                <div className="flex flex-wrap gap-[20px]">
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Teléfono" />
                    <InputTypeText texto="3731455158" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="E-mail (personal)" />
                    <InputTypeText texto="tomasguzman@gmail.com" />
                  </div>
                </div>
              </div>
            </div> */}
          </div>
        </form>
      </div>
    </div>
  );
}

export default NuevoPedido;
