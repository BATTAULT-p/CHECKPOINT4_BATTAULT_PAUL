import React from "react";
import { Link } from "react-router-dom";
import picture from "../assets/img/haveToLog.gif";
import "../styles/Error.css";

function Error() {
  return (
    <div className="error-page">
      <h1>Oups !</h1>
      <p>La page que vous recherchez n'existe pas.</p>
      <img src={picture} alt="Error" className="error-gif" />
      <Link to="/" id="button-error">
        Page d'accueil
      </Link>
    </div>
  );
}

export default Error;
