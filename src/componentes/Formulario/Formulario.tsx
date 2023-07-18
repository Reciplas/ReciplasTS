import { useForm } from "react-hook-form";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import "./Formulario.css";
import logo from "../../img/reciplas-logo.png";

const Formulario = () => {
  const {
    register,
    formState: { errors },
    handleSubmit,
  } = useForm();

  const navigate = useNavigate();
  const [email, setEmail] = useState("");

  const onSubmit = () => {
    switch (email) {
      case "tobiassebastianstegmayer@gmail.com":
        navigate("/Administracion/Ventas");
        break;
      case "lautaroacosta@gmail.com":
        navigate("/Produccion/MateriaPrima");
        break;
      default:
        break;
    }
  };

  return (
    <div className="login-background">
      <div className="contenedor-login">
        <div className="formato_logo">
          <img src={logo} alt="Logo reciplas" />
        </div>

        <form onSubmit={handleSubmit(onSubmit)}>
          <div className="usuario-contraseña">
            <div className="input-style">
              <div className="campo-obligatorio">
                <label>Correo Eléctronico</label>
                <p>*</p>
              </div>
              <input
                type="text"
                {...register("email", {
                  pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/i,
                })}
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
              {errors.email?.type === "pattern" && (
                <p className="error-msg">Ingrese un Email válido</p>
              )}
            </div>

            <div className="input-style">
              <div className="campo-obligatorio">
                <label>Contraseña</label>
                <p>*</p>
              </div>
              <input
                type="password"
                {...register("contrasena", {
                  required: true,
                })}
              />
              {errors.contrasena?.type === "required" && (
                <p className="error-msg">Ingrese una contraseña válida</p>
              )}
            </div>
          </div>
          <input type="submit" value="INICIAR SESIÓN" className="btn-login" />
        </form>
        <div className="recuperar-pswr">
          <p>¿Olvidaste tu contraseña?</p>
        </div>
      </div>
    </div>
  );
};

export default Formulario;
