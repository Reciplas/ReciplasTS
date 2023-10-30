import "./Header.css";
import { Link } from "react-router-dom";

function Header({
  perfil,
  area,
  fotoDe,
}: {
  perfil: string;
  area: string;
  fotoDe: string;
}) {
  return (
    <div className="contenedor-header">
      <div className="perfil">
        <div className="perfil-area">
          <div className="area-nombre">
            <strong>Área {area}</strong>
            <p>{perfil}</p>
          </div>
          <Link to={`/${area}/Perfil`} className="dialog Link">
            <img
              className="person"
              src={require(`../img/foto-${fotoDe}.jpg`)}
              alt="foto de perfil"
            />
            <div className="triangulo"></div>
            <div className="bloque-dialogo">Editar Perfil</div>
          </Link>
        </div>
      </div>
    </div>
  );
}

export default Header;
