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
        <h2>Bienvenue</h2>
        <h3>dans le Game Club !</h3>
      </div>
      <div className="home-content">
        <div className="home-consoles">
          <div className="titleBloc">
            <div className="tiret" />
            <h2>Les Consoles</h2>
            <div className="tiret" />
          </div>
          <div className="home-bloc-consoles">
            {consoles.map((console) => (
              <ConsoleCard console={console} />
            ))}
          </div>
        </div>
        <div className="home-games">
          <div className="titleBloc-game">
            <div className="tiret-game" />
            <h2>Les Jeux</h2>
            <div className="tiret-game" />
          </div>
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
