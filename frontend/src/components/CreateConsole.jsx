import React, { useState } from "react";
import axios from "axios";
import "../styles/CrudCss.css";

function CreateConsole() {
  const [message, setMessage] = useState("");
  const [consoleForm, setConsoleForm] = useState({ firm_id: 1 });

  const handleChange = (event) => {
    setConsoleForm({
      ...consoleForm,
      [event.target.name]: event.target.value,
    });
  };

  const handleCreateSubmit = (event) => {
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    axios
      .post(`${apiUrl}console/create`, consoleForm)
      .then((res) => {
        if (res.status === 200) {
          // eslint-disable-next-line no-undef
          setMessage("console créée");
        }
      })
      .catch((err) => setMessage(err.response.data.message));
    event.preventDefault();
  };

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
        <p className="wrong-password-login">{message}</p>
        <input className="create-button" type="submit" value="Créer" />
      </form>
    </div>
  );
}

export default CreateConsole;
