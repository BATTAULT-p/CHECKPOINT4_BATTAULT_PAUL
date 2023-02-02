const express = require("express");

const consoleRouter = express.Router();

const consoleController = require("../controllers/consoleController");

consoleRouter.get("/", consoleController.getAllConsoles);
consoleRouter.get("/:id", consoleController.getConsoleById);
consoleRouter.post("/create", consoleController.createConsole);
consoleRouter.put("/update/:id", consoleController.updateConsole);
consoleRouter.delete("/:id", consoleController.deleteConsoleById);

module.exports = consoleRouter;
