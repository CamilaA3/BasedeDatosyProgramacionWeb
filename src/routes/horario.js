const express = require('express');
const router = express.Router();

const conn = require('../database');

router.get('/horario', (req,res) => {
    res.render('horario.ejs');
});

module.exports = router;