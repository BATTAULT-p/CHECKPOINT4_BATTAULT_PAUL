import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "../pages/Home";
import SignIn from "../pages/SignIn";
import Login from "../pages/Login";
import BoardAdmin from "../pages/BoardAdmin";
import LoginAdmin from "../pages/LoginAdmin";
import ProtectedRouteAdmin from "../context/ProtectedRouteAdmin";
import Error from "../pages/Error";

function Transition() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/signIN" element={<SignIn />} />
      <Route path="/login" element={<Login />} />
      <Route path="/loginAdmin" element={<LoginAdmin />} />
      <Route
        path="/boardAdmin"
        element={
          <ProtectedRouteAdmin>
            <BoardAdmin />
          </ProtectedRouteAdmin>
        }
      />
      <Route path="*" element={<Error />} />
    </Routes>
  );
}

export default Transition;
