import React from "react";
import { Component } from "react";
import { Route } from "react-router-dom";

import Home from "./Home";
import Settings from "./Settings";
import Sensors from "./Sensors";
import Notifications from "./Notifications";
import Stream from "./Stream";
// import Navbar from "./Navbar";
import Tab from "./Tab";




class Dashboard extends Component {

  componentDidMount(){
    const token = localStorage.getItem("access_token")
    console.log(token)
  }

  render() {
    return (
      <div className="container">
        <Tab />
        <Route exact path={"/dashboard"} component={Home} />
        <Route exact path={"/dashboard/home"} component={Home} />
        <Route exact path={"/dashboard/sensors"} component={Sensors} />
        <Route exact path={"/dashboard/settings"} component={Settings} />
        <Route exact path={"/dashboard/streams"} component={Stream} />
        <Route exact path={"/dashboard/notifications"} component={Notifications} />
      </div>
    );
  }
}

export default Dashboard;
