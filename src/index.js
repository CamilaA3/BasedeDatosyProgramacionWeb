const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const path = require('path');//es para que funcione en windows y linux por el  / o \
const passport = require('passport');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const PassportLocal = require('passport-local').Strategy;

app.set('port', process.env.PORT || 3000);
app.set('views',path.join(__dirname,'views')); //es donde va a estar la carpeta de lsa vistas, dirname es para dar la direccion correcta del archivo
app.set('view engine','ejs'); //este es el motor de vista, se puede cambiar donde aparece el ejs
app.use(bodyParser.json());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(cookieParser('el secreto'));
app.use(session({
     secret: 'el secreto',
     resave: true, //la sesión se guardar cada vez
     saveUninitialized: true    //Si inicializamos y no le guardamos nada igual va a guardar
}));
app.use(passport.initialize());
app.use(passport.session());

passport.serializeUser(function(user,done){
    done(null,user);
});
passport.deserializeUser(function(obj,done){
    done(null, obj);
});
passport.use(new PassportLocal({
        passReqToCallback : true
    }, function(req, email, password, done){
        const conn = require('../src/database');
        conn.query('select * from empleado where email_empleado = ?', email, function(err,resp,campos){
            if(!err){
                if(resp.length > 0){
                    var user = resp[0];
                    if(password==user.password_empleado){
                        app.get('/perfil', (req,res) =>{
                            res.render('perfil.ejs');
                        });
                        return done(null,{
                            id: user.id_empleado,
                            nombre: user.nombre_empleado,
                            email: user.email_empleado
                        });
                    }else{
                        return done(null,false);
                    }
                }else{
                    console.log(err);
                }
            }else{
                console.log(err)
            }
        })
    }
));
app.get('/logout', function(req, res) {
     req.logout();
     req.session.destroy();
     res.redirect('/');

});
app.use(require('./routes/empleado'));
app.use(require('./routes/proveedor'));
app.use(require('./routes/comida'));
app.use(require('./routes/animal'));
app.use(require('./routes/horario'));
app.use(require('./routes/contacto'));

app.get('/', (req,res) => {
    res.render('index.ejs');
});

app.listen(app.get('port'), () =>{
    console.log('Servidor en puerto ',app.get('port'))
});//localhost:'puerto'