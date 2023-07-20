import { BtnIcon } from "./Boton";
export function Popup({ opciones }: { opciones: string[] }) {
  return (
    <div className="bg-white-1  w-[150px] h-fit px-[10px] py-[15px] z-50 absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[10px]">
      <form className="flex gap-0 ">
        {opciones.map((opcion, index) => (
          <div key={index} className="flex gap-[5px] hover:cursor-pointer">
            <input
              className="peer"
              type="radio"
              id={opcion}
              name="ratio"
              value={opcion}
              defaultChecked={opcion === "Fecha"}
            />
            <label
              className="hover:cursor-pointer w-fit p-[7px]  peer-checked:font-semibold  ease-in duration-100 "
              htmlFor={opcion}>
              {opcion}
            </label>
          </div>
        ))}
      </form>
      <BtnIcon
        estilo="rounded border-bordes-input border-solid border-2 p-[7px] hover:bg-white-4 hover:cursor-pointer transition active:translate-y-[-2px] w-[100%] flex items-center justify-between gap-[2px]"
        texto="Ascendente"
        icono="north"
        accion={() => {}}
      />
    </div>
  );
}
