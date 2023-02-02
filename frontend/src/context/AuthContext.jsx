import { createContext, useState, useEffect, useMemo } from "react";
import PropTypes from "prop-types";
import { useNavigate } from "react-router-dom";

export const authContext = createContext({});

function AuthProvider({ children }) {
  const navigate = useNavigate();
  const [auth, setAuth] = useState(() => {
    const data = window.localStorage.getItem("user");
    return data ? { data: JSON.parse(data) } : {};
  });

  const [user, setUser] = useState();

  const login = (data) => {
    setAuth({ data });
    if (data.role_id === 2) {
      setUser("admin");
      navigate("/boardAdmin");
    } else {
      setUser("user");
      navigate("/");
    }
  };

  const logout = () => {
    window.localStorage.removeItem("user");
    setAuth({});
    navigate("/", { replace: true, state: "Disconnected" });
  };

  useEffect(() => {
    const data = window.localStorage.getItem("user");

    if (data) {
      setAuth({ data: JSON.parse(data) });
    }
  }, []);

  useEffect(() => {
    if (auth.data) {
      window.localStorage.setItem("user", JSON.stringify(auth.data));
    }
  }, [auth]);

  const value = useMemo(() => ({ auth, login, logout, user }), [auth]);

  return <authContext.Provider value={value}>{children}</authContext.Provider>;
}

export default AuthProvider;

AuthProvider.propTypes = {
  children: PropTypes.element.isRequired,
};
