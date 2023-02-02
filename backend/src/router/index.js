const express = require("express");

const router = express.Router();
const adminRouter = require("./adminRouter");
const userRouter = require("./userRouter");
const gameRouter = require("./gameRouter");
const consoleRouter = require("./consoleRouter");

router.use("/admin", adminRouter);
router.use("/user", userRouter);
router.use("/game", gameRouter);
router.use("/console", consoleRouter);

module.exports = router;
