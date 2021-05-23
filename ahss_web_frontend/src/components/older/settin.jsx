import React, {Component} from 'react';
import axiosInstance from "../axiosApi";

class Settings extends Component {
    constructor(props) {
        super(props);
        this.state = {
            message: null,
        };
        this.getMessage = this.getMessage.bind(this);
    }

    componentDidMount() {
        const messageData1 = this.getMessage();
        console.log("messageData1: ", JSON.stringify(messageData1, null, 4));
    }

    async getMessage() {
        try {
            let response = await axiosInstance.get('/app/settings/');
            const message = response.data.results;
            this.setState({
                message: message[0].id + ' => ' + message[0].name + ': ' + message[0].state,
            });
            return message;
        } catch (error) {
            console.log("Error: ", JSON.stringify(error, null, 4));
            throw error;
        }
    }

    render() {
        return (
            <div>
                <p>Hello</p>
                <p>{this.state.message}</p>
            </div>
        );
    }
}

export default Settings;