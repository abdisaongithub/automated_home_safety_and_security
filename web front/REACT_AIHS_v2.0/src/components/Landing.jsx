import React from "react";
import "./Landing.css";
import {Link} from 'react-router-dom';
import logo from "../components/icons/logo.png";

function Landing() {

  return (
    <div className="landing">
      <img className="brand" src={logo} alt="" />
     <p>Welcome to AIHS</p>
     <Link className="landing_button" to="/login">Get Started</Link>
    </div>
  );
}

export default Landing;
