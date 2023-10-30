import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MenuLateralProduccion } from "../componentes/MenuLateral";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";

function Perfil() {
  const nombre = "Lautaro";
  const apellido = "Acosta";
  const nombreYape = nombre + " " + apellido;
  const {
    register,
    formState: { errors },
    handleSubmit,
  } = useForm();
  return (
    <div className="App">
      <MenuLateralProduccion seccionActual="" />
      <div className="contenedor-principal">
        <Header perfil={nombreYape} area="Produccion" fotoDe="osiris" />

        <form>
          <div className="flex items-center gap-[20px]">
            <h1 className="text-[50px]">Tu perfil </h1>
            <Btn estilo="btnImprimir" valor="Editar" />
          </div>

          <div className="flex flex-col gap-[20px] border-b-2 border-b-solid border-b-bordes-input pb-[20px]   ">
            <h1>Información personal</h1>
            <div className="flex  gap-[30px] h-fit">
              <img
                className="flex justify-center items-center w-64 h-64 rounded-[50%] object-cover"
                src={require(`../img/foto-osiris.jpg`)}
                alt="Foto de perfil del usuario"
              />
              <div className=" p-[10px] flex flex-wrap flex-col gap-[20px]">
                <div className="flex flex-wrap gap-[20px]">
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Nombre" />
                    <InputTypeText texto="Lautaro" />
                  </div>
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Apellido" />
                    <InputTypeText texto="Acosta" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="E-mail (nombre de usuario)" />
                    <InputTypeText texto="Produccion@reciplas.com" />
                  </div>
                </div>
                <Btn estilo="btnImprimir" valor="Cambiar contraseña" />
              </div>
            </div>
          </div>
          <div className="flex flex-col gap-[20px] border-b-2 border-b-solid border-b-bordes-input pb-[20px]   ">
            <h1>Información de contacto</h1>
            <div className="flex flex-wrap gap-[30px] h-fit">
              <div className=" p-[10px] flex flex-col gap-[20px]">
                <div className="flex flex-wrap gap-[20px]">
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Provincia" />
                    <InputTypeText texto="Corrientes" />
                  </div>
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Ciudad" />
                    <InputTypeText texto="Corrientes" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="Calle" />
                    <InputTypeText texto="Las Violetas" />
                  </div>
                  <div className=" h-fit w-[100px] ">
                    <LabelObligatorio texto="Nro" />
                    <InputTypeText texto="3250" />
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
                    <InputTypeText texto="3794021106" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="E-mail (personal)" />
                    <InputTypeText texto="lautaroacosta@gmail.com" />
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* <div className="w-[100%] flex justify-end">
            <Btn estilo="btnImprimir" valor="Editar perfil" />
          </div> */}
        </form>
      </div>
    </div>
  );
}

export default Perfil;
