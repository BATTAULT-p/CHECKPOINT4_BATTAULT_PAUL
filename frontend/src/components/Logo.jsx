import React from "react";
import { NavLink } from "react-router-dom";
import gameclubLogo from "../assets/img/mission-gaming-gaming.png";
import "../styles/Logo.css";

function Logo() {
  return (
    <NavLink to="/">
      <div>
        <img src={gameclubLogo} alt="gameclub-logo" className="gameclub-logo" />
      </div>
    </NavLink>
  );
}

export default Logo;
