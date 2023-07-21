import { Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";

export function Detalle() {
  return (
    <div className="flex flex-col gap-[20px] border-b-2 border-b-solid border-b-bordes-input pb-[20px]   ">
      <div className="flex flex-wrap gap-[30px] h-fit">
        <div className=" p-[10px] flex flex-col gap-[20px]">
          <div className="flex flex-wrap gap-[20px]">
            <div className=" h-fit w-[66px] ">
              <Label texto="ID" estilo="h-[30px] " />
              <InputTypeText texto="123" />
            </div>
            <div className=" h-fit w-[66px] ">
              <Label texto="Cuota" estilo="h-[30px] " />
              <InputTypeText texto="1/4" />
            </div>
            <div className=" h-fit w-[150px] ">
              <Label texto="Cliente" estilo="h-[30px] " />
              <InputTypeText texto="Amber Shutte" />
            </div>
            <div className=" h-fit w-[150px] ">
              <Label texto="Fecha" estilo="h-[30px] " />
              <InputTypeText texto="5/30/2023" />
            </div>
            <div className=" h-fit w-[150px] ">
              <Label texto="Número de Pedido" estilo="h-[30px] " />
              <InputTypeText texto="235" />
            </div>

            <div className=" h-fit w-[150px] ">
              <Label texto="Precio Unitario" estilo="h-[30px] " />
              <InputTypeText texto="$321" />
            </div>
            <div className=" h-fit w-[150px] ">
              <Label texto="Importe Total" estilo="h-[30px] " />
              <InputTypeText texto="$5235" />
            </div>
            <div className="h-fit w-[320px]">
              <Label texto="Descripción" estilo="h-[30px] " />
              <textarea
                rows={10}
                className=" w-[100%] border-solid border-2 rounded-[5px] px-[10px] border-bordes-input overflow-hidden">
                Descripción
              </textarea>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
