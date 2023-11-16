import React from "react";
import "./Boton.css";
import { Popup, PopupPeriodo, PopupPrecio, PopupCuotas } from "./Popup";
import { useState } from "react";

export function BtnIcon({
  icono,
  texto,
  accion,
  estilo,
}: {
  icono: string;
  texto: string;
  accion: () => void;
  estilo: string;
}) {
  return (
    <button type="button" className={estilo} onClick={accion}>
      {texto && <span>{texto}</span>}
      <span className="material-symbols-outlined">{icono}</span>
    </button>
  );
}

export function BtnBuscador({
  buscarPor,
  estilo,
}: {
  buscarPor: string;
  estilo: string;
}) {
  return (
    <div className={estilo}>
      <input type="text" placeholder={buscarPor} />
      <span className="material-symbols-outlined">search</span>
    </div>
  );
}

export function Filtro({
  estilo,
  items,
  retornarOpcion,
  opcionSeleccionada,
}: {
  estilo: string;
  items: string[];
  retornarOpcion: (event: React.ChangeEvent<HTMLSelectElement>) => void;
  opcionSeleccionada: string;
}) {
  // este es un btn de filtro, hay que pasarle una lista de opciones
  return (
    <div className={estilo}>
      <select value={opcionSeleccionada} onChange={retornarOpcion}>
        {items.map((item, index) => (
          <option key={index} value={item}>
            {item}
          </option>
        ))}
      </select>
      <span className="material-symbols-outlined">expand_more</span>
    </div>
  );
}

export function Btn({
  tipo,
  estilo,
  valor,
}: {
  tipo: string;
  estilo: string;
  valor: string;
}) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion
  const items = ["Fecha", "ID", "Total"];

  return (
    <div className="relative ">
      <input type={tipo} value={valor} className={estilo} />
    </div>
  );
}

export function BtnPopUp({
  estilo,
  valor,
  items,
}: {
  estilo: string;
  valor: string;
  items: string[];
}) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion
  const [estadoPopup, cambiarEstadoPopup] = useState<boolean>(false);

  return (
    <div className="h-fit relative">
      <input
        type="button"
        value={valor}
        className={estilo}
        onClick={() => cambiarEstadoPopup(!estadoPopup)}
      />
      {estadoPopup && (
        <div
          className="w-[100vw] h-[100vh] fixed top-0 left-0 z-10"
          onClick={() => cambiarEstadoPopup(!estadoPopup)}></div>
      )}
      <Popup
        opciones={items}
        estado={estadoPopup}
        cambiarEstado={cambiarEstadoPopup}
      />
    </div>
  );
}

export function BtnPopUpPeriodo({
  estilo,
  valor,
}: {
  estilo: string;
  valor: string;
}) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion

  const [estadoPopup, cambiarEstadoPopup] = useState<boolean>(false);

  return (
    <div className="h-fit relative">
      <input
        type="button"
        value={valor}
        className={estilo}
        onClick={() => cambiarEstadoPopup(!estadoPopup)}
      />
      {estadoPopup && (
        <div
          className="w-[100vw] h-[100vh] fixed top-0 left-0 z-10"
          onClick={() => cambiarEstadoPopup(!estadoPopup)}></div>
      )}
      <PopupPeriodo estado={estadoPopup} cambiarEstado={cambiarEstadoPopup} />
    </div>
  );
}

export function BtnPopUpTotal({
  estilo,
  valor,
}: {
  estilo: string;
  valor: string;
}) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion

  const [estadoPopup, cambiarEstadoPopup] = useState<boolean>(false);

  return (
    <div className="h-fit relative">
      <input
        type="button"
        value={valor}
        className={estilo}
        onClick={() => cambiarEstadoPopup(!estadoPopup)}
      />
      {estadoPopup && (
        <div
          className="w-[100vw] h-[100vh] fixed top-0 left-0  z-10"
          onClick={() => cambiarEstadoPopup(!estadoPopup)}></div>
      )}
      <PopupPrecio estado={estadoPopup} cambiarEstado={cambiarEstadoPopup} />
    </div>
  );
}

export function BtnPopUpCuotas({
  estilo,
  valor,
}: {
  estilo: string;
  valor: string;
}) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion

  const [estadoPopup, cambiarEstadoPopup] = useState<boolean>(false);

  return (
    <div className="h-fit relative">
      <input
        type="button"
        value={valor}
        className={estilo}
        onClick={() => cambiarEstadoPopup(!estadoPopup)}
      />
      {estadoPopup && (
        <div
          className="w-[100vw] h-[100vh] fixed top-0 left-0 z-10"
          onClick={() => cambiarEstadoPopup(!estadoPopup)}></div>
      )}
      <PopupCuotas
        opciones={["Todos", "Adeuda", "Finalizados"]}
        estado={estadoPopup}
        cambiarEstado={cambiarEstadoPopup}
      />
    </div>
  );
}

export function BtnRatio({ opciones }: { opciones: string[] }) {
  return (
    <form className="flex flex-row gap-0 w-fit bg-fondo-de-filtros border-solid border-2 border-dark-green rounded-[5px] select-none overflow-hidden">
      {opciones.map((opcion, index) => (
        <div key={index} className="flex gap-[5px] hover:cursor-pointer">
          <input
            className="hidden peer"
            type="radio"
            id={opcion}
            name="ratio"
            value={opcion}
            defaultChecked={opcion === "Todos"}
          />
          <label
            className="hover:cursor-pointer w-fit p-[7px]  peer-checked:bg-verde-clarito  peer-checked:font-semibold  ease-in duration-100 "
            htmlFor={opcion}>
            {opcion}
          </label>
        </div>
      ))}
    </form>
  );
}
