const express = require('express');
const router = express.Router();

const conn = require('../database');

router.get('/comida', (req,res) => { //metodo para seleccionar los datos
    conn.query('select * from comida',(err,resp,campos) => {
        if(!err){
            res.json(resp);
        }else{
            console.log(err);
        }
    });
});

module.exports = router;