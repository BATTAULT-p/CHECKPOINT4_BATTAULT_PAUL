import React from "react";
import Logo from "./components/Logo";
import NavBar from "./components/NavBar";
import Transition from "./components/Transition";
import Footer from "./components/Footer";
import "./App.css";

function App() {
  return (
    <div className="App">
      <Logo />
      <NavBar />
      <Transition />
      <Footer />
    </div>
  );
}

export default App;
