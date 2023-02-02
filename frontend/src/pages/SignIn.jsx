import { useState, useEffect, useContext } from "react";
import { useNavigate, Link } from "react-router-dom";
import axios from "axios";
import { authContext } from "../context/AuthContext";
import "../styles/SignIn.css";

function SignIn() {
  const { auth } = useContext(authContext);
  const [formData, setFormData] = useState({ role_id: 1 });
  const [error, setError] = useState("");
  const navigate = useNavigate();

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

  useEffect(() => {
    if (
      formData.passwordConfirm &&
      formData.password !== formData.passwordConfirm
    ) {
      setError("Les mots de passes que vous avez saisis ne correspondent pas.");
    } else {
      setError("");
    }
  }, [formData]);

  const handleSubmit = (event) => {
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    if (error === "") {
      axios
        .post(`${apiUrl}user/createProfile`, formData)
        .then((res) => {
          if (res.status === 201) {
            navigate("/login");
          }
        })
        .catch((err) => setError(err));
    }

    event.preventDefault();
  };
  return (
    <div className="signIn-global">
      <div className="signin-title-section">
        <h1 className="signin-title">Créer mon compte</h1>
      </div>
      <div className="signIn-form">
        <form onSubmit={handleSubmit}>
          <div className="signIn-rubrique">
            <label className="signIn-label" htmlFor="Email">
              Adresse email:
              <input
                className="signIn-input"
                type="text"
                id="email"
                name="email"
                value={formData.email}
                onChange={handleChange}
              />
            </label>
          </div>
          <div className="signIn-rubrique">
            <label className="signIn-label" htmlFor="firstname">
              Firstname:
              <input
                className="signIn-input"
                type="text"
                id="firstname"
                name="firstname"
                value={formData.firstname}
                onChange={handleChange}
              />
            </label>
          </div>
          <div className="signIn-rubrique">
            <label className="signIn-label" htmlFor="lastname">
              Lastname:
              <input
                className="signIn-input"
                type="text"
                id="lastname"
                name="lastname"
                value={formData.lastname}
                onChange={handleChange}
              />
            </label>
          </div>
          <label className="signIn-label" htmlFor="password">
            Mot de passe:
            <div className="signIn-password-input-g">
              <input
                className="signIn-input"
                type="password"
                id="password"
                name="password"
                value={formData.password}
                onChange={handleChange}
              />
            </div>
          </label>
          <label className="signIn-label" htmlFor="password-confirm">
            Confirmez votre mot de passe:
            <div className="relative">
              <input
                className="signIn-input"
                type="password"
                id="password-confirm"
                name="passwordConfirm"
                value={formData.passwordConfirm}
                onChange={handleChange}
              />
            </div>
          </label>
          <p className="wrong-password">{error}</p>
          <input
            className="signinButton"
            type="submit"
            value="Créer votre compte"
          />
        </form>
        <p className="signinNoAccountText">
          Vous avez déjà un compte ?{" "}
          <span className="signinNoAccountTextLink">
            <Link to="/login" className="signIn-login-link">
              S’identifier
            </Link>
          </span>
        </p>
      </div>
    </div>
  );
}

export default SignIn;
