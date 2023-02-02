import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import axios from "axios";
import "../styles/CrudCss.css";

function ModifyConsole({ selectedConsole }) {
  const [message, setMessage] = useState("");
  const [consoleForm, setConsoleForm] = useState({});

  const handleChange = (event) => {
    setConsoleForm({
      ...consoleForm,
      [event.target.name]: event.target.value,
    });
  };

  const handleCreateSubmit = (event) => {
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    axios
      .put(`${apiUrl}console/update/${selectedConsole.id}`, consoleForm)
      .then((res) => {
        if (res.status === 200) {
          // eslint-disable-next-line no-undef
          setMessage("console modifiée");
        }
      })
      .catch((err) => setMessage(err.response.data.message));
    event.preventDefault();
  };

  useEffect(() => {
    setConsoleForm(selectedConsole);
  }, [selectedConsole]);

  return (
    <div className="create-form">
      <form name="create" method="post" onSubmit={handleCreateSubmit}>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Nom de la console :
          </label>
          <input
            className="create-input"
            type="text"
            name="title"
            id="title"
            value={consoleForm.title}
            onChange={handleChange}
          />
        </div>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Firm Id :
          </label>
          <input
            className="create-input"
            type="text"
            name="firm_id"
            id="firm_id"
            value={consoleForm.firm_id}
            onChange={handleChange}
          />
        </div>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Lien photo :
          </label>
          <input
            className="create-input"
            type="text"
            name="photo"
            id="photo"
            value={consoleForm.photo}
            onChange={handleChange}
          />
        </div>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Description :
          </label>
          <input
            className="create-input"
            type="text"
            name="description"
            id="description"
            value={consoleForm.description}
            onChange={handleChange}
          />
        </div>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Quantité :
          </label>
          <input
            className="create-input"
            type="number"
            name="quantity"
            id="quantity"
            value={consoleForm.quantity}
            onChange={handleChange}
          />
        </div>
        <div className="create-rubrique">
          <label className="create-label" htmlFor="title">
            Prix :
          </label>
          <input
            className="create-input"
            type="number"
            name="price"
            id="price"
            value={consoleForm.price}
            onChange={handleChange}
          />
        </div>
        <p className="validCss">{message}</p>
        <input className="create-button" type="submit" value="Modifier" />
      </form>
    </div>
  );
}

export default ModifyConsole;

ModifyConsole.propTypes = {
  selectedConsole: PropTypes.element.isRequired,
};
