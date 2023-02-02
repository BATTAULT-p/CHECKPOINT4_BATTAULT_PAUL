import React, { useState, useEffect } from "react";
import { GetAllConsoles } from "../utils/getApi";
import "../styles/BoardAdmin.css";
import CreateConsole from "../components/CreateConsole";
import ModifyConsole from "../components/ModifyConsole";
import DeleteConsole from "../components/DeleteConsole";

function BoardAdmin() {
  const [consoles, setConsoles] = useState([]);
  const [fonction, setFonction] = useState("");
  const [selectedConsole, setSelectedConsole] = useState({});

  const getConsoles = async () => {
    setConsoles(await GetAllConsoles());
  };

  // function Affichage() {
  //   switch (fonction) {
  //     case "creer":
  //       return <CreateConsole />;
  //     case "modifier":
  //       return <ModifyConsole selectedConsole={selectedConsole} />;
  //     case "delete":
  //       return (
  //         <DeleteConsole
  //           selectedConsole={selectedConsole}
  //           setSelectedConsole={setSelectedConsole}
  //         />
  //       );
  //     default:
  //       return <div />;
  //   }
  // }

  useEffect(() => {
    getConsoles();
  }, []);

  const refresh = () => {
    getConsoles();
  };

  return (
    <div className="homePageAdmin">
      <div className="homePage-title-admin">
        <h1>Espace administrateur</h1>
      </div>
      <div className="home-content-admin">
        <div className="home-consoles-admin">
          <div className="action-consoles">
            <h3>Console sélectionné : {selectedConsole.title}</h3>
            <button
              type="button"
              className="button-Admin"
              onClick={() => setFonction("creer")}
            >
              Ajouter une console
            </button>
            <button
              type="button"
              className="button-Admin"
              onClick={() => setFonction("modifier")}
            >
              Modifier la console selectionnée
            </button>
            <button
              type="button"
              className="button-Admin-delete"
              onClick={() => setFonction("delete")}
            >
              Supprimer la console selectionnée
            </button>
            <button type="button" className="button-Admin" onClick={refresh}>
              Rafraichir
            </button>
          </div>
          <div>
            {() => {
              if (fonction === "creer") {
                return <CreateConsole />;
              }
              if (fonction === "modifier") {
                return <ModifyConsole selectedConsole={selectedConsole} />;
              }
              if (fonction === "delete") {
                return (
                  <DeleteConsole
                    selectedConsole={selectedConsole}
                    setSelectedConsole={setSelectedConsole}
                  />
                );
              }
              return <div />;
            }}
          </div>
          {/* <div>{Affichage()}</div> */}
          <div className="admin-consoles">
            {consoles.map((console) => (
              <div
                className="console-inline"
                onClick={() => setSelectedConsole(console)}
                onKeyDown=""
                role="presentation"
              >
                <h3 className="console-element">{console.title}</h3>
                <p className="console-element">console ID: {console.id}</p>
                <p className="console-element">quantité: {console.quantity}</p>
                <p className="console-element">
                  Prix/journée: {console.price} euros
                </p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

export default BoardAdmin;
