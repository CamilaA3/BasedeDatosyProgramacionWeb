const express = require('express');
const router = express.Router();

const conn = require('../database');

router.get('/proveedor', (req,res) => { //metodo para seleccionar los datos
    conn.query('Select * from proveedor',(err,resp,campos) => {
        if(!err){
            res.json(resp);
        }else{
            console.log(err);
        }
    });
});

module.exports = router;