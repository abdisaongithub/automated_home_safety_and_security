import React from "react";
import "./Index.css";
import { Route } from "react-router-dom";
import Navbar from "./navbar/Navbar";
import Template from "../pages/Template/Template";
import Temperature from "../pages/Temperature/Temperature";
import LiveStream from "../pages/LiveStream/LiveStream";
import Settings from "../pages/Settings/Settings";
import Login from "../pages/login/Login";
import { useHistory } from "react-router-dom";

const Index = () => {
  let history = useHistory();
  !localStorage.getItem("accessToken") && history.push("/login");

  return (
    <div className="container">
      <Route exact path="/login">
        <Login />
      </Route>
      <Route exact path="/dashboard">
        <Navbar title={"HOME"} />
        <div className="content">
          <div className="content__left">
            <Template />
          </div>
        </div>
      </Route>

      <Route exact path="/temperature">
        <Navbar title={"Settings"} />
        <div className="content">
          <div className="content__left">
            <Temperature
              temp="34"
              status="danger"
              unit="°C"
              color="red"
              text="Temperature"
            />
          </div>
        </div>
      </Route>

      <Route exact path="/settings">
        <Navbar title={"Settings"} />
        <div className="content">
          <div className="content__left">
            <Settings />
          </div>
        </div>
      </Route>
      <Route exact path="/livestream">
        <Navbar title={"Live Stream"} />
        <div className="content">
          <div className="content__left">
            <LiveStream />
          </div>
        </div>
      </Route>
    </div>
  );
};

export default Index;
