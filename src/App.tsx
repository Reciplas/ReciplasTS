import "./App.css";
import { Route, Routes } from "react-router-dom";
import Login from "./Login";

import AdmVentas from "./Administracion/Ventas";
import AdmMP from "./Administracion/MateriaPrima";
import AdmProductos from "./Administracion/Productos";
import AdmUsuarios from "./Administracion/Usuarios";
import AdmClientes from "./Administracion/Clientes";
import AdmProveedores from "./Administracion/Proveedores";
import AdmPerfil from "./Administracion/Perfil";

import ProdMP from "./Produccion/MateriaPrima";
import ProdProductos from "./Produccion/Productos";
import ProdPedidos from "./Produccion/Pedidos";
import ProdPerfil from "./Produccion/Perfil";

import ComprasProveedores from "./Compras/Proveedores";
import ComprasMP from "./Compras/MateriaPrima";
import ComprasPedidos from "./Compras/Pedidos";
import ComprasPerfil from "./Compras/Perfil";

import VentasVentas from "./Ventas/Ventas";
import VentasPedidos from "./Ventas/Pedidos";
import VentasProveedores from "./Ventas/Proveedores";
import VentasClientes from "./Ventas/Clientes";
import VentasProductos from "./Ventas/Productos";
import VentasPerfil from "./Ventas/Perfil";

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
        <Route path="/Compras/Pedidos" element={<ComprasPedidos />} />
        <Route path="/Compras/Perfil" element={<ComprasPerfil/>} />

        <Route path="/Ventas/Ventas" element={<VentasVentas />} />
        <Route path="/Ventas/Pedidos" element={<VentasPedidos />} />
        <Route path="/Ventas/Productos" element={<VentasProductos />} />
        <Route path="/Ventas/Proveedores" element={<VentasProveedores />} />
        <Route path="/Ventas/Clientes" element={<VentasClientes />} />
        <Route path="/Ventas/Perfil" element={<VentasPerfil/>} />

        <Route path="/Produccion/MateriaPrima" element={<ProdMP />} />
        <Route path="/Produccion/Productos" element={<ProdProductos />} />
        <Route path="/Produccion/Pedidos" element={<ProdPedidos />} />
        <Route path="/Produccion/Perfil" element={<ProdPerfil/>} />
      </Routes>
    </div>
  );
}
export default App;
