const express = require('express');
const router = express.Router();

const conn = require('../database');

router.get('/animales_perfil', (req,res) => { //metodo para seleccionar los datos
    conn.query('select * from animal',(err,resp,campos) => {
        if(!err){
            res.render('animales_perfil.ejs',{
                datos: resp
            });
        }else{
            console.log(err);
        }
    });
});

router.post('/agregar',(req, res) => {
    //console.log(req.body);
    const {id_animal, nombre_animal, apodo_animal, descripcion_animal, familia_animal, id_empleado, id_entrega} = req.body;
    conn.query('INSERT into animal SET? ',{
        id_animal: id_animal,
        nombre_animal: nombre_animal,
        apodo_animal: apodo_animal,
        descripcion_animal: descripcion_animal,
        familia_animal: familia_animal,
        id_empleado: id_empleado,
        id_entrega: id_entrega
    }, (err, result) => {
        if(!err) {
            res.redirect('/animales_perfil');
        } else {
            console.log(err);
        }
    });
});
router.get('/eliminar/:id', (req,res) =>{
    const { id } = req.params;
    conn.query('DELETE from animal WHERE id_animal = ?', [id], (err, resp, campos) => {
        if(!err){ 
            res.redirect('/animales_perfil')
        }else{
            console.log(err);
        }
    });
});
router.post('/editar',(req, res) => {
    const {id_animal, nombre_animal, apodo_animal, descripcion_animal, familia_animal, id_empleado, id_entrega} = req.body;
    conn.query('UPDATE animal SET nombre_animal = ?, apodo_animal = ?, descripcion_animal = ?, familia_animal = ?, id_empleado = ?, id_entrega = ? where id_animal = ?',[nombre_animal, apodo_animal, descripcion_animal, familia_animal, id_empleado, id_entrega, id_animal], (err, result) => {
        if(!err) {
            res.redirect('/animales_perfil');
        }else{
            console.log(err);
        }
    });
});