import "./App.css";
import { Route, Routes } from "react-router-dom";
import AdmVentas from "./Administracion/Ventas";
import AdmMP from "./Administracion/MateriaPrima";
import AdmProductos from "./Administracion/Productos";
import AdmUsuarios from "./Administracion/Usuarios";
import AdmClientes from "./Administracion/Clientes";
import AdmProveedores from "./Administracion/Proveedores";
import AdmPerfil from "./Administracion/Perfil";
import Login from "./Login";

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
        </Routes>
    </div>
  );
}
export default App;
