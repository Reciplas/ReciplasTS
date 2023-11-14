import { useForm } from "react-hook-form";
import "../App.css";
import Header from "../componentes/Header";
import { MenuLateral } from "../componentes/MenuLateral";
import { LabelObligatorio, Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Btn, BtnIcon } from "../componentes/Boton";

function Perfil() {
  const nombre = "Tobias";
  const apellido = "Stegmayer";
  const nombreYape = nombre + " " + apellido;
  const {
    register,
    formState: { errors },
    handleSubmit,
  } = useForm();
  return (
    <div className="App">
      <MenuLateral seccionActual="" />
      <div className="contenedor-principal">
        <Header perfil={nombreYape} area="Administracion" fotoDe="canela" />

        <form>
          <div className="flex items-center gap-[20px]">
            <h1 className="text-[50px]">Tu perfil </h1>
            <Btn tipo="button" estilo="btnImprimir" valor="Editar" />
          </div>

          <div className="flex flex-col gap-[20px] border-b-2 border-b-solid border-b-bordes-input pb-[20px]   ">
            <h1>Información personal</h1>
            <div className="flex  gap-[30px] h-fit">
              <img
                className="flex justify-center items-center w-64 h-64 rounded-[50%] object-cover"
                src={require(`../img/foto-canela.jpg`)}
                alt="Foto de perfil del usuario"
              />
              <div className=" p-[10px] flex flex-wrap flex-col gap-[20px]">
                <div className="flex flex-wrap gap-[20px]">
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Nombre" />
                    <InputTypeText texto="Tobias" />
                  </div>
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Apellido" />
                    <InputTypeText texto="Stegmayer" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="E-mail (nombre de usuario)" />
                    <InputTypeText texto="Administración@reciplas.com" />
                  </div>
                </div>
                <Btn
                  tipo="button"
                  estilo="btnImprimir"
                  valor="Cambiar contraseña"
                />
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
                    <InputTypeText texto="Chaco" />
                  </div>
                  <div className=" h-fit w-[150px] ">
                    <LabelObligatorio texto="Ciudad" />
                    <InputTypeText texto="Resistencia" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="Calle" />
                    <InputTypeText texto="Pasaje gob. Bosch" />
                  </div>
                  <div className=" h-fit w-[100px] ">
                    <LabelObligatorio texto="Nro" />
                    <InputTypeText texto="1365" />
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
                    <InputTypeText texto="3624103405" />
                  </div>
                  <div className=" h-fit w-[300px] ">
                    <LabelObligatorio texto="E-mail (personal)" />
                    <InputTypeText texto="tobiastegmayer@gmail.com" />
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
