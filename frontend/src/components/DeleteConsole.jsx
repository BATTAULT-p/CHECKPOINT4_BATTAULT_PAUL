import React, { useState } from "react";
import PropTypes from "prop-types";
import axios from "axios";
import "../styles/CrudCss.css";

function DeleteConsole({ selectedConsole, setSelectedConsole }) {
  const [message, setMessage] = useState("");

  const handleDeleteSubmit = (event) => {
    event.preventDefault();
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    axios
      .delete(`${apiUrl}console/${selectedConsole.id}`)
      .then((res) => {
        if (res.status === 200) {
          // eslint-disable-next-line no-undef
          setMessage("console supprimée");
          setSelectedConsole({});
        }
      })
      .catch((err) => setMessage(err.response.data.message));
  };

  return (
    <div className="create-form">
      <form name="create" method="post" onSubmit={handleDeleteSubmit}>
        <p className="validCss">
          Êtes-vous sur de vouloir supprimer cette console ?
        </p>
        <p className="delete-message">{message}</p>
        <input className="create-button" type="submit" value="Supprimer" />
      </form>
    </div>
  );
}

export default DeleteConsole;

DeleteConsole.propTypes = {
  selectedConsole: PropTypes.element.isRequired,
  setSelectedConsole: PropTypes.element.isRequired,
};
