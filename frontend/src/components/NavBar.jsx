import React, { useState, useEffect, useContext } from "react";
import { NavLink } from "react-router-dom";
import { authContext } from "../context/AuthContext";
import { navBarUser, navBarAdmin, navBarSignIn } from "../utils/navBarLinks";
import searchLogo from "../assets/img/search.png";
import deco from "../assets/img/deco.png";
import "../styles/NavBar.css";

function NavBar() {
  const { auth, logout } = useContext(authContext);
  const [navBar, setNavBar] = useState([]);
  const [search, setSearch] = useState(false);
  const [scrolled, setScrolled] = useState(false);

  const searchFonction = () => {
    setSearch(!search);
  };

  useEffect(() => {
    if (auth.data) {
      switch (auth.data.role_id) {
        case 2:
          return setNavBar(navBarAdmin);
        case 1:
          return setNavBar(navBarUser);
        default:
          return setNavBar(navBarSignIn);
      }
    } else {
      return setNavBar(navBarSignIn);
    }
  }, [auth]);

  useEffect(() => {
    const onScroll = () => {
      if (window.scrollY > 70) {
        setScrolled(true);
      } else {
        setScrolled(false);
      }
    };
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <div className={scrolled ? "navbar-scrolled" : "navbar"}>
      <div className="navbar-div">
        <img
          src={searchLogo}
          alt="search"
          className="search-icon"
          onKeyDown=""
          role="presentation"
          onClick={searchFonction}
        />
        {navBar.map((section) => (
          <NavLink to={section.link} className="navbar-items" key={section.id}>
            {section.name}
          </NavLink>
        ))}
        {auth.data && (
          <img
            src={deco}
            alt="deconnexion"
            className="logout"
            onClick={logout}
            title="Deconnexion"
            onKeyDown=""
            role="presentation"
          />
        )}
      </div>
    </div>
  );
}

export default NavBar;
