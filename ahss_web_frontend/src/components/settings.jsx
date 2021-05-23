import React, { Component } from "react";
import axiosInstance from "../axiosApi";

class Setting extends Component {
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
        <p>{this.state.message}</p>
        <ul class="list-group mt-3 w-75 container-fluid">
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Camera
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Gas Sensor
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Motion Sensor
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Temperature Sensor
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Humidity Sensor
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
          <div class="list-group-item d-flex justify-content-between align-items-center">
            Sound Alert
            <input
              type="checkbox"
              checked
              data-toggle="toggle"
              data-onstyle="outline-success"
              data-offstyle="outline-danger"
            />
          </div>
         
        </ul>
      </div>
    );
  }
}

export default Setting;
