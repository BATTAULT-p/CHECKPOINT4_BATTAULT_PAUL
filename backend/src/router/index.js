const express = require("express");

const router = express.Router();
const adminRouter = require("./adminRouter");
const userRouter = require("./userRouter");
const gameRouter = require("./gameRouter");

router.use("/admin", adminRouter);
router.use("/user", userRouter);
router.use("/game", gameRouter);

module.exports = router;
