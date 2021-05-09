import './App.css';
import {Switch, Route, Link} from "react-router-dom";
import Login from "./components/login";
import Signup from "./components/settings";
import {Component} from "react";

class App extends Component {
    render() {
        return (
            <div className="site">
                <nav>
                    <Link className={"nav-link"} to={"/"}>Home</Link>
                    <Link className={"nav-link"} to={"/login/"}>Login</Link>
                    <Link className={"nav-link"} to={"/settings/"}>Settings</Link>
                </nav>
                <main>
                    <h1>Ahhh after 10,000 years I'm free. Time to conquer
                        the Earth!</h1>
                    <Switch>
                        <Route exact path={"/login/"} component={Login}/>
                        <Route exact path={"/signup/"} component={Signup}/>
                        <Route exact path={"/settings/"} component={Signup}/>
                        <Route path={"/"} render={() => <div>Home
                            again</div>}/>
                    </Switch>
                </main>
            </div>
        );
    }
}

export default App;
