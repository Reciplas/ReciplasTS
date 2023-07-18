import React, { useState } from "react";
import "../App.css";
import "../Perfil.css";
import Header from "../componentes/Header/Header";
import { MenuLateral } from "../componentes/MenuLateral/MenuLateral";
import { BtnBuscador, Filtro } from "../componentes/Boton/Boton";

function Perfil() {
  const nombreYape = "Tobias Stegmayer";
  return (
    <div className="App">
      <MenuLateral seccionActual="" />
      <div className="contenedor-principal">
        <Header perfil={nombreYape} area="Administracion" fotoDe="canela" />
        <div>
          <img
            className="fotoPerfil"
            src={require(`../img/foto-canela.jpg`)}
            alt="foto de perfil"
          />
        </div>
      </div>
    </div>
  );
}

export default Perfil;
