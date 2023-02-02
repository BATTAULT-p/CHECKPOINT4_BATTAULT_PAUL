import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "../pages/Home";
import SignIn from "../pages/SignIn";
import Login from "../pages/Login";
import BoardAdmin from "../pages/BoardAdmin";
import GameDetails from "../pages/GameDetails";
import Error from "../pages/Error";

function Transition() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/signIN" element={<SignIn />} />
      <Route path="/login" element={<Login />} />
      <Route path="/boardAdmin" element={<BoardAdmin />} />
      <Route path="/gameDetails/:id" element={<GameDetails />} />
      <Route path="*" element={<Error />} />
    </Routes>
  );
}

export default Transition;
