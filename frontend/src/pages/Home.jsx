import React, { useState, useEffect } from "react";
import { GetAllConsoles, GetAllGames } from "../utils/getApi";
import ConsoleCard from "../components/ConsoleCard";
import GameCard from "../components/GameCard";
import "../styles/Home.css";

export default function Home() {
  const [consoles, setConsoles] = useState([]);
  const [games, setGames] = useState([]);

  const getConsoles = async () => {
    setConsoles(await GetAllConsoles());
  };
  const getGames = async () => {
    setGames(await GetAllGames());
  };

  useEffect(() => {
    getConsoles();
    getGames();
  }, []);

  return (
    <div className="homePage">
      <div className="homePage-title">
        <h1>Bienvenue dans le Game Club !</h1>
      </div>
      <div className="home-content">
        <div className="home-consoles">
          <h2>Les Consoles :</h2>
          <div className="home-bloc-consoles">
            {consoles.map((console) => (
              <ConsoleCard console={console} />
            ))}
          </div>
        </div>
        <div className="home-games">
          <h2>Les Jeux :</h2>
          <div className="home-bloc-games">
            {games.map((game) => (
              <GameCard game={game} />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
