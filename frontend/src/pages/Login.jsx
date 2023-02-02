import React, { useState, useContext, useEffect } from "react";
import { useNavigate, Link } from "react-router-dom";
import axios from "axios";
import { authContext } from "../context/AuthContext";
import "../styles/Login.css";

function Connexion() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({});
  const [error, setError] = useState("");
  const { login, auth } = useContext(authContext);

  useEffect(() => {
    if (auth.data) {
      navigate("/");
    }
  }, []);

  const handleChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
    });
  };

  const handleSubmit = (event) => {
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    axios
      .post(`${apiUrl}user/login`, formData)
      .then((res) => {
        if (res.status === 200) {
          // eslint-disable-next-line no-undef
          login(res.data);
        }
      })
      .catch((err) => setError(err.response.data.message));
    event.preventDefault();
  };

  return (
    <div className="login-global">
      <div className="login-title-section">
        <h1 className="login-title">Connecte toi</h1>
      </div>
      <div className="login-form">
        <form name="connexion" method="post" onSubmit={handleSubmit}>
          <div className="login-rubrique">
            <label className="login-label" htmlFor="Email">
              Adresse email
            </label>
            <input
              className="login-input"
              type="email"
              name="email"
              id="email"
              placeholder="test@blabla.com"
              value={formData.email}
              onChange={handleChange}
            />
          </div>
          <div className="login-rubrique">
            <label className="login-label" htmlFor="password">
              Mot de passe
            </label>
            <input
              className="login-input"
              type="password"
              name="password"
              placeholder=""
              value={formData.password}
              onChange={handleChange}
            />
          </div>
          <p className="wrong-password-login">{error}</p>
          <input className="login-button" type="submit" value="Connexion" />
          <div className="small_link">
            <span className="loginNoAccountTextLink">
              <Link to="/Signin">Créer un profil ici </Link>
            </span>
          </div>
        </form>
      </div>
    </div>
  );
}

export default Connexion;
