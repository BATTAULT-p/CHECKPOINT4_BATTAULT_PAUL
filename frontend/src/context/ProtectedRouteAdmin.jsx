/* eslint-disable consistent-return */
import React, { useContext } from "react";
import PropTypes from "prop-types";
import { Navigate } from "react-router-dom";
import { authContext } from "./AuthContext";

function ProtectedRouteAdmin({ children }) {
  const { auth } = useContext(authContext);

  if (auth.data) {
    if (auth.data.role_id !== 2) {
      return <Navigate to="/" />;
    }
    return children;
  }
}

export default ProtectedRouteAdmin;

ProtectedRouteAdmin.propTypes = {
  children: PropTypes.element.isRequired,
};
