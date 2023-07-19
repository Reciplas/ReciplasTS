import { useState, useEffect, useRef } from "react";
import reciplasLogo from "../../img/reciplas-logo.png";
import reciplasLogoChico from "../../img/reciplas-logoChico.png";
import "./MenuLateral.css";
import { Link } from "react-router-dom";
import { BtnIcon } from "../Boton/Boton";

export function MenuLateral({ seccionActual }: { seccionActual: string }) {
  const menuLateralRef = useRef<HTMLDivElement>(null);
  const imagenRef = useRef<HTMLImageElement>(null);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    const menuLateral = menuLateralRef.current;
    const imagen = imagenRef.current;

    if (menuLateral && imagen) {
      if (clicked) {
        menuLateral.style.width = "55px";
        imagen.style.width = "40px";
        imagen.style.margin = "15px 0 10px 0";
      } else {
        menuLateral.style.width = "225px";
        imagen.style.width = "200px";
        imagen.style.margin = "10px 0 10px 0";
      }
    }
  }, [clicked]);

  const manejarClick = () => {
    setClicked(!clicked);
  };

  return (
    <div className={"contenedor-menu"} ref={menuLateralRef}>
      <BtnIcon
        icono={clicked ? "menu_open" : "menu"}
        accion={manejarClick}
        estilo="btnMenu"
        texto=""
      />
      <div className="nav">
        <div className="contenedor-img">
          <img
            src={clicked ? reciplasLogoChico : reciplasLogo}
            alt="logo reciplas"
            ref={imagenRef}
          />
        </div>

        <Link
          to="/Administracion/Ventas"
          className={
            seccionActual === "Ventas" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">monitoring</span>
          </div>
          <div className="seccionMenu">Ventas</div>
        </Link>

        <Link
          to="/Administracion/MateriaPrima"
          className={
            seccionActual === "MP" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">token</span>
          </div>
          <div className="seccionMenu">Materia Prima</div>
        </Link>

        <Link
          to="/Administracion/Productos"
          className={
            seccionActual === "Productos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">shelves</span>
          </div>
          <div className="seccionMenu">Productos</div>
        </Link>

        <Link
          to="/Administracion/Usuarios"
          className={
            seccionActual === "Usuarios" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">person_add</span>
          </div>
          <div className="seccionMenu">Usuarios</div>
        </Link>

        <Link
          to="/Administracion/Clientes"
          className={
            seccionActual === "Clientes" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">groups</span>
          </div>
          <div className="seccionMenu">Clientes</div>
        </Link>

        <Link
          to="/Administracion/Proveedores"
          className={
            seccionActual === "Proveedores" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">local_shipping</span>
          </div>
          <div className="seccionMenu">Proveedores</div>
        </Link>
      </div>

      <Link to="/" className="icono-seccion">
        <div className="iconoMenu">
          <span className="material-symbols-outlined">logout</span>
        </div>

        <div className="seccionMenu">Cerrar Sesión</div>
      </Link>
    </div>
  );
}

export function MLcompras({ seccionActual }: { seccionActual: string }) {
  const menuLateralRef = useRef<HTMLDivElement>(null);
  const imagenRef = useRef<HTMLImageElement>(null);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    const menuLateral = menuLateralRef.current;
    const imagen = imagenRef.current;

    if (menuLateral && imagen) {
      if (clicked) {
        menuLateral.style.width = "55px";
        imagen.style.width = "40px";
        imagen.style.margin = "15px 0 10px 0";
      } else {
        menuLateral.style.width = "225px";
        imagen.style.width = "200px";
        imagen.style.margin = "10px 0 10px 0";
      }
    }
  }, [clicked]);

  const manejarClick = () => {
    setClicked(!clicked);
  };
  return (
    <div className={"contenedor-menu"} ref={menuLateralRef}>
      <BtnIcon
        icono={clicked ? "menu_open" : "menu"}
        accion={manejarClick}
        estilo="btnMenu"
        texto=""
      />
      <div className="nav">
        <div className="contenedor-img">
          <img
            src={clicked ? reciplasLogoChico : reciplasLogo}
            alt="logo reciplas"
            ref={imagenRef}
          />
        </div>

        <Link
          to="/Compras/Proveedores"
          className={
            seccionActual === "Proveedores" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">local_shipping</span>
          </div>
          <div className="seccionMenu">Proveedores</div>
        </Link>

        <Link
          to="/Compras/MateriaPrima"
          className={
            seccionActual === "MP" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">token</span>
          </div>
          <div className="seccionMenu">Materia Prima</div>
        </Link>

        <Link
          to="/Compras/Pedidos"
          className={
            seccionActual === "Pedidos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">box</span>
          </div>
          <div className="seccionMenu">Pedidos</div>
        </Link>
      </div>

      <Link to="/" className="icono-seccion">
        <div className="iconoMenu">
          <span className="material-symbols-outlined">logout</span>
        </div>

        <div className="seccionMenu">Cerrar Sesión</div>
      </Link>
    </div>
  );
}

export function MLventas({ seccionActual }: { seccionActual: string }) {
  const menuLateralRef = useRef<HTMLDivElement>(null);
  const imagenRef = useRef<HTMLImageElement>(null);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    const menuLateral = menuLateralRef.current;
    const imagen = imagenRef.current;

    if (menuLateral && imagen) {
      if (clicked) {
        menuLateral.style.width = "55px";
        imagen.style.width = "40px";
        imagen.style.margin = "20px 0 10px 0";
      } else {
        menuLateral.style.width = "225px";
        imagen.style.width = "200px";
        imagen.style.margin = "10px 0 10px 0";
      }
    }
  }, [clicked]);

  const manejarClick = () => {
    setClicked(!clicked);
  };

  return (
    <div className={"contenedor-menu"} ref={menuLateralRef}>
      <BtnIcon
        icono={clicked ? "menu_open" : "menu"}
        accion={manejarClick}
        estilo="btnMenu"
        texto=""
      />
      <div className="nav">
        <div className="contenedor-img">
          <img
            src={clicked ? reciplasLogoChico : reciplasLogo}
            alt="logo reciplas"
            ref={imagenRef}
          />
        </div>

        <Link
          to="/Ventas/Ventas"
          className={
            seccionActual === "Ventas" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">monitoring</span>
          </div>
          <div className="seccionMenu">Ventas</div>
        </Link>
        <Link
          to="/Ventas/Productos"
          className={
            seccionActual === "Productos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">shelves</span>
          </div>
          <div className="seccionMenu">Productos</div>
        </Link>
        <Link
          to="/Ventas/Pedidos"
          className={
            seccionActual === "Pedidos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">box</span>
          </div>
          <div className="seccionMenu">Pedidos</div>
        </Link>
        <Link
          to="/Ventas/Proveedores"
          className={
            seccionActual === "Proveedores" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">local_shipping</span>
          </div>
          <div className="seccionMenu">Proveedores</div>
        </Link>
        <Link
          to="/Ventas/Clientes"
          className={
            seccionActual === "Clientes" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">groups</span>
          </div>
          <div className="seccionMenu">Clientes</div>
        </Link>
      </div>

      <Link to="/" className="icono-seccion">
        <div className="iconoMenu">
          <span className="material-symbols-outlined">logout</span>
        </div>

        <div className="seccionMenu">Cerrar Sesión</div>
      </Link>
    </div>
  );
}

export function MenuLateralProduccion({
  seccionActual,
}: {
  seccionActual: string;
}) {
  const menuLateralRef = useRef<HTMLDivElement>(null);
  const imagenRef = useRef<HTMLImageElement>(null);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    const menuLateral = menuLateralRef.current;
    const imagen = imagenRef.current;

    if (menuLateral && imagen) {
      if (clicked) {
        menuLateral.style.width = "55px";
        imagen.style.width = "40px";
        imagen.style.margin = "15px 0 10px 0";
      } else {
        menuLateral.style.width = "225px";
        imagen.style.width = "200px";
        imagen.style.margin = "10px 0 10px 0";
      }
    }
  }, [clicked]);

  const manejarClick = () => {
    setClicked(!clicked);
  };
  return (
    <div className={"contenedor-menu"} ref={menuLateralRef}>
      <BtnIcon
        icono={clicked ? "menu_open" : "menu"}
        accion={manejarClick}
        estilo="btnMenu"
        texto=""
      />
      <div className="nav">
        <div className="contenedor-img">
          <img
            src={clicked ? reciplasLogoChico : reciplasLogo}
            alt="logo reciplas"
            ref={imagenRef}
          />
        </div>

        <Link
          to="/Produccion/MateriaPrima"
          className={
            seccionActual === "MP" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">token</span>
          </div>
          <div className="seccionMenu">Materia Prima</div>
        </Link>

        <Link
          to="/Produccion/Productos"
          className={
            seccionActual === "Productos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">shelves</span>
          </div>
          <div className="seccionMenu">Productos</div>
        </Link>

        <Link
          to="/Produccion/Pedidos"
          className={
            seccionActual === "Pedidos" ? "seccion-actual" : "icono-seccion"
          }>
          <div className="iconoMenu">
            <span className="material-symbols-outlined">box</span>
          </div>
          <div className="seccionMenu">Pedidos</div>
        </Link>
        
      </div>
      <Link to="/" className="icono-seccion">
      <div className="iconoMenu">
      <span className="material-symbols-outlined">logout</span>
      </div>

      <div className="seccionMenu">Cerrar Sesión</div>
      </Link>
    </div>
  );
}
