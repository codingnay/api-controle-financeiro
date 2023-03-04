// Carrega o módulo "express.js".
const express = require('express');

const router = express.Router();

const bodyParser = require('body-parser').json();

const spendingControl = require('./spendingControl');
const userControl = require('./userControl');

router.get("/", (req, res) => {
    res.json({
        status: "error",
        message: "Bad request"
    });
});

router.get("/spending/", spendingControl.getAll);
router.get("/spending/:id", spendingControl.getOne);
router.post("/spending/", bodyParser, spendingControl.post);
router.put("/spending/:id", bodyParser, spendingControl.put);
router.delete("/spending/:id", spendingControl.delete);

router.get("/user/", userControl.getAll);
router.get("/user/:id", userControl.getOne);
router.post("/user/", bodyParser, userControl.post);
router.put("/user/:id", bodyParser, userControl.put);
router.delete("/user/:id", userControl.delete);

module.exports = router;