import React, { Component } from "react";
import { Link } from "react-router-dom";

class Navbar extends Component {
  render() {
    return (
        <nav className="navbar navbar-expand-lg navbar-dark d-flex bg-dark">
          <div className="container-fluid">
            <Link className={"nav-link"} to={"/dashboard"}>
              AIHS
            </Link>
            <button
              className="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarNavDropdown"
              aria-controls="navbarNavDropdown"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span className="navbar-toggler-icon"></span>
            </button>
            <div className="collapse navbar-collapse d-flex" id="navbarNavDropdown">
              <ul className="navbar-nav ms-auto" >
                <li className="nav-item">
                  <Link className={"nav-link"} to={"/dashboard/sensors"}>
                    Sensors
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className={"nav-link"} to={"/dashboard/settings"}>
                    Settings
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className={"nav-link"} to={"/dashboard/streams"}>
                    Stream
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className={"nav-link"} to={"/dashboard/Notifications"}>
                    Notifications
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className={"nav-link"} to={"/Logout"}>
                    Logout
                  </Link>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    );
  }
}

export default Navbar;
