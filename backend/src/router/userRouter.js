const express = require("express");

const userRouter = express.Router();

const userController = require("../controllers/userController");
const checkEmail = require("../middlewares/checkEmail");
const emailValidator = require("../middlewares/Validator");
const { upload } = require("../helpers/multer");

userRouter.get("/", userController.getAllUsers);
userRouter.get("/:id", userController.getUserById);
userRouter.post(
  "/createProfile",
  checkEmail,
  emailValidator,
  userController.createUser
);
userRouter.post("/login", userController.login);
userRouter.put(
  "/uploadPhoto/:id",
  upload.single("file"),
  userController.updatePhoto
);
userRouter.put("/:id", userController.updateUser);
userRouter.delete("/:id", userController.deleteUser);

module.exports = userRouter;
