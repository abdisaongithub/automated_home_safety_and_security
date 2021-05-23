import "./App.css";
import { Switch, Route } from "react-router-dom";
import { Component } from "react";
// import Login from "./components/Login";
import SignIn from "./components/SignIn";
import Dashboard from "./components/Dashboard";

class App extends Component {
  render() {
    return (
      <div className="site ">
        <div className="mt-5" id="signin-welcome">
          <h1 className="display-4">AIHS</h1>
          <p className="lead font-italic ">
            Automated and Integrated Home Security
          </p>
          <hr className="" />
        </div>
        <Switch>
          <Route exact path={"/"} component={SignIn} />
          <Route exact path={"/logout"} component={SignIn} />
          <Route path={"/dashboard"} component={Dashboard} />
        </Switch>
      </div>
    );
  }
}

export default App;
