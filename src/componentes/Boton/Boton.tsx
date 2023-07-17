import React from "react";
import "./Boton.css";

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
    <button className={estilo} onClick={accion}>
      <span className="material-symbols-outlined">{icono}</span>
      {texto && <span>{texto}</span>}
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

export function Btn({ estilo, valor }: { estilo: string; valor: string }) {
  // Este Boton es la plantilla de un boton para utilizar en la seccion de filtros arriba de una tabla, el boton abrira un popup para elegir la opcion
  return <input type="button" value={valor} className={estilo} />;
}
