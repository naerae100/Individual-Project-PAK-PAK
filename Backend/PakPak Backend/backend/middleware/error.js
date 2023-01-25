const ErrorHandler = require("../utils/errorhandler");

module.exports = (err, req, res, next) => {
  err.statusCode = err.statusCode || 500;
  err.message = err.message || "Internal Server Error";

  //wrong mongo dv id error
  if (err.name == "CastError") {
    const message = "Resources not found.Invalid:";
    err = new ErrorHandler(message, 400);
  }

  //mongoose dublication error

  if (err.code == 11000) {
    const message = `Duplicate ${Object.keys(err.keyValue)} Entered`;
    err = new ErrorHandler(message, 400);
  }

  //wrong JWT Error

  if (err.name == "JsonWebTokenError") {
    const message = `Json Web Token is invalid,try again`;
    err = new ErrorHandler(message, 400);
  }

  //JWT Expire Error
  if (err.name == "TokenExpiredError") {
    const message = `Json Web Token is Expire,try again`;
    err = new ErrorHandler(message, 400);
  }


  res.status(err.statusCode).json({
    success: false,
    message: err.message,
  });
};
