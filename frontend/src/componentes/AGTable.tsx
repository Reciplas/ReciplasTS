import { useState, useEffect, useMemo, useRef, useCallback } from "react";
import { AgGridReact } from "ag-grid-react";
import { ColDef } from "ag-grid-community";
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-alpine.css";

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

export function AGCliente({ endpointPath }: { endpointPath: string }) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [columnDefs, setColumnDefs] = useState<ColDef[]>([
    { field: "dni", filter: "agNumberColumnFilter", suppressSizeToFit: true },
    {
      field: "nombres",
      filter: "agTextColumnFilter",
      suppressSizeToFit: true,
    },
    {
      field: "apellido",
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

  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: 400, width: 600 }}>
        <AgGridReact
          //   onCellClicked={cellClickedListener} Deberia escuchar el click para agregar el nombre del cliente al pedido
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          animateRows={true}
          pagination={true}
          paginationPageSize={25}
        />
      </div>
    </div>
  );
}

export function AGProducto({ endpointPath }: { endpointPath: string }) {
  const gridRef = useRef<AgGridReact | null>(null);
  const [rowData, setRowData] = useState();
  const [columnDefs, setColumnDefs] = useState<ColDef[]>([
    {
      field: "nombre",
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

  return (
    <div>
      <div className="ag-theme-alpine" style={{ height: 300, width: 600 }}>
        <AgGridReact
          //   onCellClicked={cellClickedListener} Deberia escuchar el click para agregar el nombre del cliente al pedido
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={defaultColDef}
          animateRows={true}
          pagination={true}
          paginationPageSize={1}
        />
      </div>
    </div>
  );
}
