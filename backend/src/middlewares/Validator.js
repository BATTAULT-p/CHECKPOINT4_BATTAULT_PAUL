const { check } = require("express-validator");

const emailValidator = [
  check("email").isEmail().withMessage("Please enter a valid email address"),
  check("password")
    .isLength({ min: 4 })
    .withMessage("Password must be at least 4 characters long"),
];

module.exports = emailValidator;
