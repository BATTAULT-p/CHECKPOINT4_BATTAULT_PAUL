import React from "react";
import PropTypes from "prop-types";
import "../styles/ConsoleCard.css";

function ConsoleCard({ console }) {
  return (
    <div className="console-card">
      <div className="conteneur-photo">
        <img src={console.photo} alt={console.name} className="photo-card" />
      </div>
      <div className="conteneur-texte">
        <h3>{console.title}</h3>
        <p>il en reste {console.quantity}</p>
        <p>
          <span className="card-price">{console.price} euros</span> la journée
        </p>
      </div>
    </div>
  );
}

export default ConsoleCard;

ConsoleCard.propTypes = {
  console: PropTypes.string.isRequired,
};
