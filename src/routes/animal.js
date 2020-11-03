const express = require('express');
const router = express.Router();

const conn = require('../database');

router.get('/animales', (req,res) => { //metodo para seleccionar los datos
    conn.query('select * from animal',(err,resp,campos) => {
        if(!err){
            res.render('animales.ejs',{
                datos: resp
            });
        }else{
            console.log(err);
        }
    });
});
router.get('/ejemplo', (req,res) => { //metodo para seleccionar los datos
    conn.query('select * from animal',(err,resp,campos) => {
        if(!err){
            res.render('ejemplo.ejs',{
                datos: resp
            });
        }else{
            console.log(err);
        }
    });
});
module.exports = router;