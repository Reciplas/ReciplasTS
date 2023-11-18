import { useState } from "react";
import { BtnIcon } from "./Boton";
import { Label } from "./TextLabel";

export function PopUpError({ estado }: { estado: boolean }) {
  return (
    <>
      <div className="border-solid border-2 rounded-[5px] border-bordes-input bg-white-1 fixed top-[-140px] left-1/2 transform -translate-x-1/2 z-50 animate-slide-down">
        <div
          className={`bg-white border-solid border-2 rounded-[5px] border-bordes-input bg-[#FF0000] p-4 shadow transition-transform duration-2000 ease-in-out transform ${
            estado ? "translate-y-40" : "translate-y-0"
          }`}>
          <strong className=" text-[#ffffff]">
            Error: ingrese un producto válido
          </strong>
        </div>
      </div>
    </>
  );
}

export function Popup({
  opciones,
  estado,
  cambiarEstado,
}: {
  opciones: string[];
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-[150px] h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[10px] z-50">
          <form className="flex gap-0 ">
            {opciones.map((opcion, index) => (
              <div key={index} className="flex gap-[5px] hover:cursor-pointer">
                <input
                  className="peer accent-green"
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
      )}
    </>
  );
}

export function PopupPeriodo({
  estado,
  cambiarEstado,
}: {
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-fit h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[15px] z-50">
          <div className="flex gap-1 items-center">
            <Label texto="Desde" estilo="w-[50px]" />
            <input
              type="date"
              className="p-1.5   border-solid border-2 border-bordes-input "
            />
          </div>
          <div className="flex gap-1 items-center">
            <Label texto="Hasta" estilo="w-[50px]" />
            <input
              type="date"
              className="p-1.5   border-solid border-2 border-bordes-input "
            />
          </div>
        </div>
      )}
    </>
  );
}

export function PopupPrecio({
  estado,
  cambiarEstado,
}: {
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-fit h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[15px] z-50">
          <div className="flex gap-1 items-center">
            <Label texto="Mínimo($)" estilo="" />
            <input
              type="number"
              className="p-1.5   border-solid border-2 border-bordes-input w-[115px]"
            />
          </div>
          <div className="flex gap-1 items-center">
            <Label texto="Máximo($)" estilo="" />
            <input
              type="number"
              className="p-1.5   border-solid border-2 border-bordes-input w-[115px]"
            />
          </div>
        </div>
      )}
    </>
  );
}

export function PopupCuotas({
  opciones,
  estado,
  cambiarEstado,
}: {
  opciones: string[];
  estado: boolean;
  cambiarEstado: (nuevoEstado: boolean) => void;
}) {
  return (
    <>
      {estado && (
        <div className="bg-white-1  w-[150px] h-fit px-[10px] py-[15px] absolute top-[110%] border-solid border-2 rounded border-bordes-input shadow-lg flex flex-col gap-[10px] z-50">
          <form className="flex gap-0 ">
            {opciones.map((opcion, index) => (
              <div key={index} className="flex gap-[5px] hover:cursor-pointer">
                <input
                  className="peer accent-green"
                  type="radio"
                  id={opcion}
                  name="ratio"
                  value={opcion}
                  defaultChecked={opcion === "Todos"}
                />
                <label
                  className="hover:cursor-pointer w-fit p-[7px]  peer-checked:font-semibold  ease-in duration-100 "
                  htmlFor={opcion}>
                  {opcion}
                </label>
              </div>
            ))}
          </form>
        </div>
      )}
    </>
  );
}
