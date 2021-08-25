import React from "react";
import ok from "../icons/ok.svg";
import alert from "../icons/alert.svg";
import { Link } from "react-router-dom";
import "./Card.css";

function Cards({ status, text, value, link, color, unit }) {
  return (
    <div className={"card " + color}>
      <h3 className="card__title">{text}</h3>
      {value === null ? (
        <img
          className="status_bigAlert"
          src={status === "danger" ? alert : ok}
          alt=""
        />
      ) : (
        <h2 className="card__value">
          {" "}
          {value}
          <span>{unit}</span>
        </h2>
      )}{" "}
      <Link className="card__more_link" to={link}>
        More...
      </Link>
      {value === null ? (
        <></>
      ) : (
        <img
          className="status_button"
          src={status === "danger" ? alert : ok}
          alt=""
        />
      )}
    </div>
  );
}

export default Cards;
