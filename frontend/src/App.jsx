import React from "react";
import Logo from "./components/Logo";
import NavBar from "./components/NavBar";
import Transition from "./components/Transition";
import "./App.css";

function App() {
  return (
    <div className="App">
      <Logo />
      <NavBar />
      <Transition />
    </div>
  );
}

export default App;
