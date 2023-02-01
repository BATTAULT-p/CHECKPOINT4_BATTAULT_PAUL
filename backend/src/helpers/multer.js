const multer = require("multer");

const storage = multer.diskStorage({
  destination(req, file, cb) {
    cb(null, "public/uploads/photos");
  },
  filename: (req, file, callBack) => {
    callBack(null, file.originalname);
  },
});

const upload = multer({ storage });

module.exports = { upload };
