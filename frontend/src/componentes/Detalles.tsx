import { Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import { Tabla, Paginado } from "../componentes/Tabla";

export function Detalle() {
  const columnas = [
    "Cantidad",
    "Descripción",
    "Precio Unidad",
    "Importe Total",
  ];
  const filas = [
    ["1", "Paraguas", "$5.000", "$5.000,00"],
    ["7", "Zapatillas", "$1.500", "$10.500,00"],
    ["12", "Papelera", "$2.500", "$30.000,00"],
    ["8", "Cuaderno", "$875", "$7.000,00"],
    ["6", "Mesa", "$25.000", "$150.000,00"],
    ["9", "Lampara", "$10.000", "$90.000,00"],
  ];

  return (
    <div className="flex flex-col gap-3">
      <div className="flex flex-wrap gap-[15px] min-h-[45px] items-center">
        <div className=" h-fit w-fit">
          <label>
            <b>ID:</b> 1
          </label>
        </div>
        <div className=" h-fit w-fit">
          <label>
            <b>Cliente:</b> Amber Shutte
          </label>
        </div>
        <div className=" h-fit w-fit">
          <label>
            <b>Fecha:</b> 5/30/2023
          </label>
        </div>
        <div className=" h-fit w-fit">
          <label>
            <b>Cuota:</b> 1/4
          </label>
        </div>
      </div>
      <div className="w-full h-fit overflow-y-hidden max-h-[773px] border border-slate-blue2">
        <Tabla
          columnas={columnas}
          datos={filas}
          estilo="table-fixed w-full text-left text-[15px] min-w-[400px] p-5 border-collapse"
        />
      </div>
      <div className="flex justify-between">
        <Paginado />
      </div>
    </div>
  );
}
