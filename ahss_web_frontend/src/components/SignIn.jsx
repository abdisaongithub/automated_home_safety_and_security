import React, { Component } from "react";
import lock from "./ico_lock.svg";
import axios from "axios";
// import { Link } from "react-router-dom";

class SignIn extends Component {
  constructor(props) {
    super(props);
    this.state = { email: "", password: "" };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    // console.log(this.state)
    try {
      const headers = {
        "Content-Type": "application/json",
        Accept: "application/json",
      };

      const response = axios
        .post(
          "http://192.168.43.46:8000/auth/token/obtain/",
          {
            email: this.state.email,
            password: this.state.password,
          },
          {
            headers: headers,
          }
        )
        .then((res) => {
          if (res.statusText === "OK") {
            localStorage.setItem("refresh_token", res.data.refresh);
            localStorage.setItem("access_token", res.data.access);
            this.props.history.push("/dashboard");
          } else {
            this.props.history.push("/");
          }
        })
        .catch((e) => {
          console.log(e);
        });

      return response;
    } catch (e) {
      throw e;
    }
  }

  render() {
    return (
      <div id="container">
        <div className="form-container mt-0 d-flex flex-column ">
          <div className="signin">
            <h2 className="text-center text-dark mt-2">Sign In</h2>
            <img className="sign_in_icon" src={lock} alt="" />
            <form onSubmit={this.handleSubmit} className="form-group">
              <label className="text-dark mt-2 ms-0">Username</label>
              <input
                onChange={this.handleChange}
                className="form-control"
                type="text"
                name="email"
              />
              <label className="text-dark mt-2 ms-0">Password</label>
              <input
                onChange={this.handleChange}
                className="form-control"
                type="password"
                name="password"
              />
              <div>
                <button
                  className="w-100 btn btn-outline-dark btn-block p-0 mt-4 mb-5"
                  type="submit"
                >
                  SignIn
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default SignIn;
