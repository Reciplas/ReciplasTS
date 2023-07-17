import React from "react";
import "./Tabla.css";
import { Btn, BtnIcon } from "../Boton/Boton";

function getColumnClass(columna: string) {
  switch (columna) {
    case "id":
      return "id";
    case "Email":
      return "email";
    case "Nombre":
      return "nombre";
    case "Fecha":
      return "fecha";
    case "Plástico":
      return "plastico";
    case "Precio":
      return "precio";
    case "Cantidad(kg)":
      return "cantidad";
    case "Descripción":
      return "descripcion";
    case "Ultimo Cambio":
      return "fecha";
    case "Nro":
      return "nro";
    case "Total":
      return "total";
    case "Cuotas":
      return "cuotas";
    case "Cliente":
      return "cliente";
    case "Producto":
      return "producto";
    case "Área":
      return "area";
    case "Telefono":
      return "telefono";
    case "Dirección":
      return "direccion";
    case "Fecha de ingreso":
      return "fechaIngreso";
    case "Fecha de registro":
      return "fechaIngreso";
    case " ":
      return "accion";
    case "":
      return "accion";
    default:
      return "";
  }
}

export function Tabla({
  columnas,
  datos,
}: {
  columnas: string[];
  datos: (string | undefined)[][];
}) {
  return (
    <table>
      <thead>
        <tr>
          {columnas.map((columna: string, index: number) => (
            <th key={index} className={getColumnClass(columna)}>
              {columna}
            </th>
          ))}
        </tr>
      </thead>
      <tbody>
        {datos ? (
          datos.map((fila: (string | undefined)[], rowIndex: number) => (
            <tr key={rowIndex}>
              {fila.map((dato: string | undefined, cellIndex: number) => (
                <td key={cellIndex}>{dato ?? ""}</td>
              ))}
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan={columnas.length}> No data Available </td>
          </tr>
        )}
      </tbody>
    </table>
  );
}

export function TablaEditable({
  columnas,
  datos,
  icono1,
  icono2,
}: {
  columnas: string[];
  datos: (string | undefined)[][];
  icono1: string;
  icono2: string;
}) {
  const handleEdit = (id: string) => {
    // Aquí puedes implementar la lógica para editar los campos de la fila correspondiente al ID
    console.log("Editar fila con ID:", id);
  };
  return (
    <table>
      <thead>
        <tr>
          {columnas.map((columna: string, index: number) => (
            <th key={index} className={getColumnClass(columna)}>
              {columna}
            </th>
          ))}
        </tr>
      </thead>
      <tbody>
        {datos ? (
          datos.map((fila: (string | undefined)[], rowIndex: number) => (
            <tr key={rowIndex}>
              <td>
                <BtnIcon
                  icono={icono1}
                  accion={() => handleEdit(fila[0] ?? "")}
                  estilo="accion-en-tabla"
                  texto=""
                />
              </td>
              <td>
                <BtnIcon
                  icono={icono2}
                  accion={() => handleEdit(fila[0] ?? "")}
                  estilo="accion-en-tabla"
                  texto=""
                />
              </td>
              {fila.map((dato: string | undefined, cellIndex: number) => (
                <td key={cellIndex}>{dato ?? ""}</td>
              ))}
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan={columnas.length}> No data Available </td>
          </tr>
        )}
      </tbody>
    </table>
  );
}

export function Paginado() {
  return (
    <div style={{ display: "flex", justifyContent: "space-between" }}>
      <div className="paginado-tabla">
        <BtnIcon
          icono="first_page"
          accion={() => {}}
          estilo="paginado-btn"
          texto=""
        />
        <BtnIcon
          icono="chevron_left"
          accion={() => {}}
          estilo="paginado-btn"
          texto=""
        />

        <div className="nroPaginaActual">1</div>

        <BtnIcon
          icono="chevron_right"
          accion={() => {}}
          estilo="paginado-btn"
          texto=""
        />

        <BtnIcon
          icono="last_page"
          accion={() => {}}
          estilo="paginado-btn"
          texto=""
        />
      </div>
    </div>
  );
}

export function TablaEditable2({
  columnas,
  datos,
}: {
  columnas: string[];
  datos: string[][];
}) {
  const handleEdit = (id: string) => {
    // Aquí puedes implementar la lógica para editar los campos de la fila correspondiente al ID
    console.log("Editar fila con ID:", id);
  };
  return (
    <table>
      <thead>
        <tr>
          {columnas.map((columna: string, index: number) => (
            <th key={index} className={getColumnClass(columna)}>
              {columna}
            </th>
          ))}
        </tr>
      </thead>
      <tbody>
        {datos.map((fila: string[], index: number) => (
          <tr key={index}>
            <td>
              <BtnIcon
                icono="edit"
                accion={() => handleEdit(fila[0])}
                estilo="accion-en-tabla"
                texto=""
              />
            </td>
            {fila.map((dato, index) => (
              <td key={index}>{dato}</td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
}
