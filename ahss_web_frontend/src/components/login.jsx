import React from "react";
import { Component } from "react";
import axiosInstance from "../axiosApi";
import { Link } from "react-router-dom";


class Login extends Component {
  constructor(props) {
    super(props);
    this.state = { username: "", password: "" };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    try {
      const response = axiosInstance
        .post("auth/token/obtain/", {
          username: this.state.username,
          password: this.state.password,
        })
        .then(function (value) {
          axiosInstance.defaults.headers["Authorization"] =
            "JWT " + value.data.access;

          localStorage.setItem("access_token", value.data.access);
          localStorage.setItem("refresh_token", value.data.refresh);
        });

      return response.data;
    } catch (e) {
      throw e;
    }
  }

  render() {
    return (
      <div>
        <div className="container">
          <h1 className="text-center mt-5">LogIn</h1>
          <form
            onSubmit={this.handleSubmit}
            className="form"
            action="/accounts/login/"
            method="post"
          >
            <label className="lable" htmlfor="id_username">
              USERNAME
            </label>
            <input
              className="fields"
              type="text"
              name="username"
              id="id_username"
              autofocus=""
              required=""
              value={this.state.email}
              onChange={this.handleChange}
            />
            <label className="lable" htmlfor="id_password" required="">
              PASSWORD
            </label>
            <input
              className="fields"
              type="password"
              name="password"
              id="id_username"
              value={this.state.password}
              onChange={this.handleChange}
            />
            <br />
            <button type="submit" className="loginbtn">
              <Link className={"nav-link"} to={"/dashboard"}>
                Login
              </Link>
            </button>
          </form>
        </div>
      </div>
    );
  }
}

export default Login;
