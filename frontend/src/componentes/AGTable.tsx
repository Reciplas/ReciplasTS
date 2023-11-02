import {useState, useEffect, useMemo, useRef } from "react";
import { AgGridReact} from "ag-grid-react";
import { ColDef } from "ag-grid-community"
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-alpine.css";

export function AGTable({endpointPath}:{endpointPath: string }) {

    const gridRef = useRef<AgGridReact | null>(null);
    const [rowData, setRowData] = useState();
    const [columnDefs, setColumnDefs] = useState<ColDef[]>();

    const defaultColDef = useMemo( () => ({
        sortable: true,
        filter: true,
        resizable: true,
        floatingFilter: true,
    }), []);

    useEffect(() => {
      fetch(endpointPath)
      .then(result => result.json())
      .then(data => {
        const colDefs = gridRef.current?.api?.getColumnDefs();
        if (colDefs){
            colDefs.length=0;
            const keys = Object.keys(data[0])
            keys.forEach(key => colDefs.push({field : key}));
            console.log(data)
        }
        setColumnDefs(colDefs);
        setRowData(data);
        })
      }, []);

    return (
    <div>
        <div className ='ag-theme-alpine' style={{height: 650}}>
            <AgGridReact 
                ref = {gridRef}
                rowData={rowData}
                columnDefs={columnDefs}
                defaultColDef ={defaultColDef}
                rowSelection='multiple'
                animateRows = {true}
                pagination = {true}
                paginationPageSize = {20}
            />
        </div>
    </div>
    )
}

