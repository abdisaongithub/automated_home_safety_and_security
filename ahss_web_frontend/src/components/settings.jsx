import React, {Component} from "react";

class Setting extends Component {
    constructor(props) {
        super(props);
        this.state = {
            message: null,
            settings: [],
        };
        this.fetcher = this.fetcher.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

    componentDidMount() {
        this.fetcher()
    }

    fetcher() {
        fetch("http://10.240.39.102:8000/settings/")
            .then((res) => res.json())
            .then(
                (result) => {
                    this.setState({
                        isLoaded: true,
                        settings: result.results
                    });
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error: true,
                    });
                }
            );
    }

    handleChange(e) {
        console.log(e.target.value)
        if (e.target.value === 'on'){
            e.target.value = 'off'
        }
        if (e.target.value === 'off'){
            e.target.value = 'on'
        }
    }

    render() {

        return (
            <div>
                <p>{this.state.message}</p>
                <ul className="list-group mt-3 w-75 container-fluid">
                    {
                        this.state.settings.map((val) => {
                            return (
                                <div key={val.id}
                                     className="list-group-item d-flex justify-content-between align-items-center">
                                    {
                                        val.name
                                    }
                                    {
                                        val.state === 'on' ? <input
                                            type="checkbox"
                                            checked
                                            data-toggle="toggle"
                                            data-onstyle="outline-success"
                                            data-offstyle="outline-danger"
                                            onChange={this.handleChange}

                                        /> : <input
                                            type="checkbox"
                                            data-toggle="toggle"
                                            data-onstyle="outline-success"
                                            data-offstyle="outline-danger"
                                            onChange={this.handleChange}
                                        />
                                    }


                                </div>)
                        })
                    }
                </ul>
            </div>

        );
    }
}

export default Setting;
