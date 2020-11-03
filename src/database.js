const mysql = require('mysql');
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'basededatos',
    database: 'zoologico'
});

con.connect(function(err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('Conectado')
    }
});

module.exports = con;