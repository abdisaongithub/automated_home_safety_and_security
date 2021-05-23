import React, { Component } from "react";
import SensorsSummary from './homeComponets/SensorsSummary'

class Sensors extends Component {
  render() {
    return (
      <div className="mt-5 shadow-lg">
        <SensorsSummary/>
      </div>
    );
  }
}

export default Sensors;
