import { useState, useEffect, useMemo, useRef, useCallback } from "react";
import { AgGridReact } from "ag-grid-react";
import { ColDef } from "ag-grid-community";
import { Label } from "../componentes/TextLabel";
import { InputTypeText } from "../componentes/InputField";
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-alpine.css";
import { PopUpDetalle } from "./Popup";

export function AGTable({ endpointPath }: { endpointPath: string }) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [columnDefs, setColumnDefs] = useState<ColDef[]>();

  const defaultColDef = useMemo(
    () => ({
      sortable: true,
      filter: true,
      resizable: true,
      floatingFilter: true,
    }),
    []
  );

  useEffect(() => {
    fetch(endpointPath)
      .then((result) => result.json())
      .then((data) => {
        const colDefs = gridRef.current?.api?.getColumnDefs();
        if (colDefs) {
          colDefs.length = 0;
          const keys = Object.keys(data[0]);
          keys.forEach((key) => colDefs.push({ field: key }));
          console.log(data);
        }
        setColumnDefs(colDefs);
        setRowData(data);
      });
  }, [endpointPath]);

  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: 650 }}>
        <AgGridReact
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          rowSelection="multiple"
          animateRows={true}
          pagination={true}
          paginationPageSize={20}
        />
      </div>
    </div>
  );
}

export function AGCliente({
  endpointPath,
  clienteSeleccionado,
}: {
  endpointPath: string;
  clienteSeleccionado: any;
}) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [columnDefs, setColumnDefs] = useState<ColDef[]>([
    { field: "ID", filter: "agNumberColumnFilter", width: 100 },
    { field: "DNI", filter: "agNumberColumnFilter", width: 150 },
    {
      field: "nombres",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "apellidos",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
  ]);

  const defaultColDef = useMemo(
    () => ({
      sortable: true,
      filter: true,
      floatingFilter: true,
    }),
    []
  );

  //   const cellClickedListener = useCallBack((e) => {
  //     console.log("data", e);
  //   });

  useEffect(() => {
    fetch(endpointPath)
      .then((result) => result.json())
      .then((data) => {
        setRowData(data);
      });
  }, [endpointPath]);

  const cellClickedListener = useCallback((p: any) => {
    clienteSeleccionado(p.data.ID, p.data.nombres, p.data.apellidos);
  }, []);
  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: 219, width: 572 }}>
        <AgGridReact
          //   onCellClicked={cellClickedListener} Deberia escuchar el click para agregar el nombre del cliente al pedido
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          animateRows={true}
          pagination={false}
          paginationPageSize={25}
          rowSelection="single"
          onCellClicked={cellClickedListener}
        />
      </div>
    </div>
  );
}

export function AGProducto({
  endpointPath,
  productoSeleccionado,
}: {
  endpointPath: string;
  productoSeleccionado: any;
}) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [columnDefs, setColumnDefs] = useState<ColDef[]>([
    {
      field: "nombre",
      width: 240,
    },
    {
      field: "precio",
      hide: true,
    },
  ]);

  const defaultColDef = useMemo(
    () => ({
      sortable: true,
      filter: true,
      floatingFilter: true,
    }),
    []
  );

  const cellClickedListener = useCallback((p: any) => {
    productoSeleccionado(p.data.nombre, p.data.precio);
  }, []);

  useEffect(() => {
    fetch(endpointPath)
      .then((result) => result.json())
      .then((data) => {
        setRowData(data);
      });
  }, [endpointPath]);

  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: 262, width: 262 }}>
        <AgGridReact
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          animateRows={true}
          paginationPageSize={5}
          rowSelection="single"
          onCellClicked={cellClickedListener}
        />
      </div>
    </div>
  );
}

export function AGPedidos({ endpointPath }: { endpointPath: string }) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [filaSelec, setFilaSelect] = useState([]);
  const [id_pedido, setId_Pedido] = useState(0);
  const [detalle, setDetalle] = useState(false);
  const [columnDefs, setColumnDefs] = useState<ColDef[]>([
    { field: "ID", filter: "agNumberColumnFilter", width: 150, sort: "desc" },

    {
      headerName: "Nombre",
      field: "nombres",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      headerName: "Apellido",
      field: "apellidos",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "tipo",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "forma_pago",
      headerName: "Forma de pago",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "cuotas",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "observación",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
      width: 400,
    },
    {
      field: "total",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "estado",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "fecha_creacion",
      headerName: "Fecha de creación",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "fecha_modificacion",
      headerName: "Fecha de modificación",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
  ]);

  const defaultColDef = useMemo(
    () => ({
      sortable: true,
      filter: true,
      floatingFilter: true,
    }),
    []
  );

  useEffect(() => {
    fetch(endpointPath)
      .then((result) => result.json())
      .then((data) => {
        setRowData(data);
      });
  }, [endpointPath]);

  const onSelectionChanged = useCallback(() => {
    const selectedRows = gridRef.current?.api.getSelectedRows();
    if (selectedRows && selectedRows.length > 0) {
      const selectedRowId = Number(selectedRows[0].ID);
      console.log("ID de la fila seleccionada:", selectedRowId);
      // Puedes hacer lo que quieras con el ID aquí
      fetch(`http://127.0.0.1:8000/api/linea_pedidos/${selectedRowId}`, {
        method: "get",
        headers: {
          "Content-Type": "application/json",
          // Agrega cualquier otra cabecera necesaria, como tokens de autenticación, si es necesario
        },
      })
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          setFilaSelect(data);
          setId_Pedido(selectedRowId);
          setDetalle(true);
        })
        .catch((error) => {
          console.error("Error al seleccionar pedido:", error);
        });
    }
  }, []);

  const deseleccionarFilas = () => {
    if (gridRef.current) {
      const gridApi = gridRef.current.api;
      if (gridApi.deselectAll) {
        gridApi.deselectAll();
      }
    }
  };

  return (
    <div>
      <PopUpDetalle
        estado={detalle}
        cambiarEstado={setDetalle}
        datos={filaSelec}
        id_pedido={id_pedido}
        deseleccionar={deseleccionarFilas}
      />
      <div className="ag-theme-alpine" style={{ height: 650 }}>
        <AgGridReact
          //   onCellClicked={cellClickedListener} Deberia escuchar el click para agregar el nombre del cliente al pedido
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          animateRows={true}
          pagination={false}
          paginationPageSize={25}
          rowSelection="single"
          onSelectionChanged={onSelectionChanged}
        />
      </div>
    </div>
  );
}
