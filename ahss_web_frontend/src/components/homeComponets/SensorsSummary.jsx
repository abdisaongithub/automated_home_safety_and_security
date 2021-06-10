import React, { Component } from "react";

class SensorsSummary extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      temps: [],
      humids: [],
      pres: [],
    };
  }

  fetcher() {
    fetch("http://192.168.43.46:8000/sensors/")
      .then((res) => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            temps: result.temps,
            humids: result.hum,
            pres: result.pressure,
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error,
          });
        }
      );
  }

  componentDidMount() {
    this.fetcher();
    this.reloader();
  }

  reloader() {
    setInterval(() => {
      this.fetcher();
    }, 2000);
  }

  render() {
    return (
      <div className="col col-12">
        <div className="card text-center">
          <div className="card-header">Sensors</div>

          <div className="card-body">
            <div
              className="accordion accordion-flush"
              id="accordionFlushExample"
            >
              <div className="accordion-item row">
                <h2
                  className="col accordion-header align-center"
                  id="flush-headingOne"
                >
                  <button style={{outline:'none'}}
                    className="col accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#flush-collapseOne"
                    aria-expanded="false"
                    aria-controls="flush-collapseOne"
                  >
                    Temperatures
                  </button>
                </h2>
                <div
                  id="flush-collapseOne"
                  className="accordion-collapse collapse"
                  aria-labelledby="flush-headingOne"
                  data-bs-parent="#accordionFlushExample"
                >
                  <div className="accordion-body">
                    <ul className="list-group">
                      {this.state.temps.map((t) => {
                        return (
                          <li
                            key={t.room}
                            className="list-group-item d-flex justify-content-between align-items-center"
                          >
                            {t.room}
                            <span className="badge bg-white text-dark w-50 h-100">
                              {t.temp}°C
                            </span>
                          </li>
                        );
                      })}
                    </ul>
                  </div>
                </div>
              </div>
              <div className="accordion-item row">
                <h2
                  className="col accordion-header align-center"
                  id="flush-headingTwo"
                >
                  <button
                    className="col accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#flush-collapseTwo"
                    aria-expanded="false"
                    aria-controls="flush-collapseTwo"
                  >
                    Humidity Level
                  </button>
                </h2>
                <div
                  id="flush-collapseTwo"
                  className="accordion-collapse collapse"
                  aria-labelledby="flush-headingTwo"
                  data-bs-parent="#accordionFlushExample"
                >
                  <div className="accordion-body">
                    <ul className="list-group">
                      {this.state.humids.map((h) => {
                        return (
                          <li
                            key={h.room}
                            className="list-group-item d-flex justify-content-between align-items-center"
                          >
                            {h.room}
                            <span className="badge bg-white  text-dark w-50 h-100">
                              {h.temp}%
                            </span>
                          </li>
                        );
                      })}
                    </ul>
                  </div>
                </div>
              </div>
              <div className="accordion-item row">
                <h2
                  className="col accordion-header align-center"
                  id="flush-headingThree"
                >
                  <button
                    className="col accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#flush-collapseThree"
                    aria-expanded="false"
                    aria-controls="flush-collapseThree"
                  >
                    Pressure Level
                  </button>
                </h2>
                <div
                  id="flush-collapseThree"
                  className="accordion-collapse collapse"
                  aria-labelledby="flush-headingThree"
                  data-bs-parent="#accordionFlushExample"
                >
                  <div className="accordion-body">
                    <ul className="list-group">
                      {this.state.pres.map((p) => {
                        return (
                          <li
                            key={p.room}
                            className="list-group-item d-flex justify-content-between align-items-center"
                          >
                            {p.room}
                            <span className="badge bg-white  text-dark w-50 h-100">
                              {p.temp} mbar
                            </span>
                          </li>
                        );
                      })}
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default SensorsSummary;
