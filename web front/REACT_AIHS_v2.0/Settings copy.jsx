import React from "react";
// import SubSetting from "./SubSetting/SubSetting";
import { useState } from "react";
// import axios from "axios";
import "./Settings.css";

function Settings() {
  const [humiditySensor, setHumidity_Sensor] = useState(false);
  const [temperatureSensor, setTemperature_Sensor] = useState(false);
  const [smokeSensor, setSmoke_Sensor] = useState(false);
  const [camera, setCamera] = useState(false);

  const sensorData = [
    { sensorName: "Humidity Sensor", status: true },
    { sensorName: "Temperature Sensor", status: false },
    { sensorName: "Smoke Sensor", status: true },
    { sensorName: "Camera", status: false },
  ];

  setHumidity_Sensor(sensorData[0].status);
  setTemperature_Sensor(sensorData[1].status);
  setSmoke_Sensor(sensorData[2].status);
  setCamera(sensorData[3].status);

  let kalu = [
    {
      id: 1,
      sensorName: "Humidity Sensor",
      status: true,
    },
    {
      id: 2,
      sensorName: "Temperature Sensor",
      status: false,
    },
    {
      id: 3,
      sensorName: "Smoke Sensor",
      status: true,
    },
    { id: 4, sensorName: "Camera", status: false },
  ];

  return (
    <div className="row">
      {kalu.map((i) => {
        return i.status === true ? (
          <div key={i.id} className="sub_setting sub_setting_active">
            <h3 className="sensor_title">{i.sensorName}</h3>
            <div className="setting_toggle_button">
              <div className="sub_setting_checkbox">
                <label className="switch">
                  <input
                    className="checkbox"
                    type="checkbox"
                    onChange={i.func(!i.status)}
                  />
                  <span className="slider round"></span>
                </label>
              </div>
            </div>
          </div>
        ) : (
          <div key={i.sensorName} className="sub_setting sub_setting_inactive">
            <h3 className="sensor_title">{i.sensorName}</h3>
            <div className="setting_toggle_button">
              <div className="sub_setting_checkbox">
                <label className="switch">
                  <input className="checkbox" type="checkbox" />
                  <span className="slider round"></span>
                </label>
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
}

export default Settings;
