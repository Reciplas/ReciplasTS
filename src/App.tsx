import "./App.css";
import { Route, Routes } from "react-router-dom";
import AdmVentas from "./Administracion/Ventas";
import AdmMP from "./Administracion/MateriaPrima";
import AdmProductos from "./Administracion/Productos";
import AdmUsuarios from "./Administracion/Usuarios";
import AdmClientes from "./Administracion/Clientes";
import AdmProveedores from "./Administracion/Proveedores";
import AdmPerfil from "./Administracion/Perfil";
import ProdMP from "./Produccion/MateriaPrima";
import Login from "./Login";
import ComprasProveedores from "./Compras/Proveedores";
import ComprasMP from "./Compras/MateriaPrima";
import ComprasPedidos from "./Compras/Pedidos";

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/Administracion/Ventas" element={<AdmVentas />} />
        <Route path="/Administracion/MateriaPrima" element={<AdmMP />} />
        <Route path="/Administracion/Productos" element={<AdmProductos />} />
        <Route path="/Administracion/Usuarios" element={<AdmUsuarios />} />
        <Route path="/Administracion/Clientes" element={<AdmClientes />} />
        <Route
          path="/Administracion/Proveedores"
          element={<AdmProveedores />}
        />
        <Route path="/Administracion/Perfil" element={<AdmPerfil />} />
        <Route path="/Compras/Proveedores" element={<ComprasProveedores />} />
        <Route path="/Compras/MateriaPrima" element={<ComprasMP />} />
        <Route path="/Produccion/MateriaPrima" element={<ProdMP />} />
        <Route path="/Compras/Pedidos" element={<ComprasPedidos />} />
      </Routes>
    </div>
  );
}
export default App;
