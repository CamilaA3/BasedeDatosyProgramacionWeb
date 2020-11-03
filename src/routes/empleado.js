const express = require('express');
const passport = require('passport');
const router = express.Router();

const conn = require('../database');

router.get('/perfil', (req,res) => { //metodo para seleccionar los datos
    conn.query('select * from empleado',(err,resp,campos) => {
        if(!err){
            res.render('perfil.ejs',{
                datos: resp
            });
        }else{
            console.log(err);
        }
    });
});
router.get('/login', (req,res) =>{
    res.render('login.ejs');
});

router.post('/login',passport.authenticate('local',{
    successRedirect: '/perfil',
    failureRedirect: '/login'
}));

module.exports = router;