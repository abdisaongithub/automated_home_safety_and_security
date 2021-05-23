import React, { Component } from "react";
import { Link } from "react-router-dom";
import Home from "./icons/icon-sec.svg";
import Sensors from "./icons/icon-heart.svg";
import Notification from "./icons/icon-gear.svg";
import Setting from "./icons/icon-gear.svg";
import Logout from "./icons/logout.png";

export default class Tab extends Component {
  // state = {
  //   active: [
  //     {
  //       home: true,
  //       sensor: false,
  //       notification: false,
  //       setting: false,
  //     },
  //   ],
  // };


  // function activator (arg){
  //   this.setState({
  //     active: this.state.map((s) => {
  //       console.log(s);
  //     }),
  //   });
  // };
  // Act(e){
  //   console.log('hel')  
  // }
  render() {
    return (
      <nav className="nav nav-fill bg-light shadow-sm btn-outline-dark">
        <div className="btn-outline-secondary p-2 nav-item ">
          <img className="tab_icons img-fluid " src={Home} alt="" />
          <Link className='text-dark text-decoration-none' to="/dashboard">
            HOME
          </Link>
        </div>
        <div className="btn-outline-secondary p-2 nav-item">
          <img
            className="tab_icons settings  img-fluid "
            src={Sensors}
            alt=""
          />
          <Link className='text-dark text-decoration-none' to="/dashboard/sensors">Sensors</Link>
        </div>
        <div className="btn-outline-secondary p-2 nav-item">
          <img
            className="tab_icons img-fluid "
            src={Notification}
            alt=""
          />
          <Link className='text-dark text-decoration-none' to="/dashboard/notifications">Notification</Link>
        </div>
        <div className="btn-outline-secondary p-2 nav-item">
          <img className="tab_icons img-fluid " src={Setting} alt="" />
          <Link className='text-dark text-decoration-none' to="/dashboard/settings">Settings</Link>
        </div>
        <div className="btn-outline-secondary p-2 nav-item">
          <img className="tab_icons img-fluid " src={Setting} alt="" />
          <Link className='text-dark text-decoration-none' to="/dashboard/streams">Stream</Link>
        </div>
        <div className="btn-outline-secondary p-2 nav-item">
          <img className="tab_icons img-fluid " src={Logout} alt="" />
          <Link className='text-dark text-decoration-none' to="/logout">Logout</Link>
        </div>
      </nav>
    );
    

  }
}
