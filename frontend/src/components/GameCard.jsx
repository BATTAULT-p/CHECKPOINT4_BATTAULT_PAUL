import React from "react";
import PropTypes from "prop-types";
import "../styles/GameCard.css";

function GameCard({ game }) {
  return (
    <div className="game-card">
      <div className="game-conteneur-photo">
        <img src={game.photo} alt={game.name} className="game-photo-card" />
      </div>
      <div className="game-conteneur-texte">
        <h3>{game.title}</h3>
        <p>il en reste {game.quantity}</p>
        <p>
          <span className="game-card-price">{game.price} euros</span> la journée
        </p>
      </div>
    </div>
  );
}

export default GameCard;

GameCard.propTypes = {
  game: PropTypes.element.isRequired,
};
