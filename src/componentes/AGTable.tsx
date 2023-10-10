import {useState, useEffect, useMemo, useRef, useCallback} from "react";
// AG-Grid
import {AgGridReact} from "ag-grid-react";
import {ColDef, GridApi} from "ag-grid-community"
import "ag-grid-community/styles/ag-grid.css";
import "ag-grid-community/styles/ag-theme-alpine.css";

export function AGTable() {
    const NumFilter  =  "agNumberColumnFilter";
    const TextFilter =  "agTextColumnFilter";
    const DateFilter =  "agDateColumnFilter";
    const gridRef = useRef<AgGridReact | null>(null);

    const defaultColDef = useMemo( () => ({
        sortable: true,
        filter: true,
        resizable: true,
        floatingFilter: true,
    }), []);

    const [columnDefs, setColumnDefs] = useState<ColDef[]>([
        {field: "ID", filter: NumFilter},
        {field: "Producto", filter: TextFilter},
        {field: "Cantidad", filter: NumFilter},
        {field: "Precio", filter: NumFilter},
        {field: "Descripción", filter: TextFilter},
        {field: "UltimoCambio", filter: DateFilter}
    ]);

    const [rowData, setRowData] = useState([
        {ID: 1, Producto:"Paraguas", Cantidad:"20", Precio:"$1000", Descripción:"Morbi ut odio.", UltimoCambio: "06/23/2023"},
        {ID: 2, Producto:"Mesa", Cantidad:"24", Precio:"$10000", Descripción:"In eleifend quam a odio.", UltimoCambio: "04/21/2023"},
        {ID: 3, Producto:"Mesa", Cantidad:"48", Precio:"$2000", Descripción:" Cum sociis natoque mus.", UltimoCambio: "03/01/2023"},
        {ID: 4, Producto:"Zapatillas", Cantidad:"59", Precio:"$1500", Descripción:"Sed vel enim sit.", UltimoCambio: "02/25/2023"},
        {ID: 5, Producto:"Lampara", Cantidad:"17", Precio:"$7000", Descripción:"Vivamos in felis.", UltimoCambio: "02/11/2023"},
        {ID: 6, Producto:"Mesa", Cantidad:"27", Precio:"$500", Descripción:"Integer non velit.", UltimoCambio: "07/01/2023"},
        {ID: 7, Producto:"Lampara", Cantidad:"51", Precio:"$4000", Descripción:"Morbi venstibulum.", UltimoCambio: "03/13/2023"},
        {ID: 8, Producto:"Mesa", Cantidad:"42", Precio:"$9000", Descripción:"Impsum primis.", UltimoCambio: "03/06/2023"},
        {ID: 9, Producto:"Anteojos", Cantidad:"15", Precio:"$3500", Descripción:"Sed accumsan felis.", UltimoCambio: "08/31/2023"},
        {ID: 10, Producto:"Silla", Cantidad:"44", Precio:"$1000", Descripción:"Proin eu mi.", UltimoCambio: "05/27/2023"}
    ]);
    
    // Esto es para que el ancho de las columnas de la tabla se actualizen para usar todo el ancho de la ventana.
    const sizeToFit = useCallback(() => {
        gridRef.current?.api?.sizeColumnsToFit({});
    }, []);
    
    // TODO: HACER QUE sizeToFit se ejecute cuando se carga la ventana por primera vez.
    // Me parece que esto no funciona por cómo está definida sizeToFit.
    useEffect(() => {
        console.log("ACA DEBERIA FUNCIONAR!")
        sizeToFit
    }, []);
    
    useEffect(() => {
        window.addEventListener('resize', sizeToFit);
        return () => {
            window.removeEventListener('resize', sizeToFit);
        };
    }, []);

    // Acá hay que montar el endpoint de la base de datos para recibir un archivo JSON con los datos.
    // useEffect(() => {
    //   fetch('endpoint path')
    //   .then(result => result.json())
    //   .then(rowData => setRowData(rowData))
    //   })

    //Está acá por las dudas de que me sirva mas adelante
    // const itemsList = [
    //     "Producto",
    //     "Paraguas",
    //     "Anteojos",
    //     "Camiseta",
    //     "Pantalon",
    //     "Zapatillas",
    //     "Silla",
    //     "Mesa",
    //     "Lampara",
    // ];

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
            />
        </div>
    </div>
    )
}

