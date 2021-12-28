/**** mysql */
//variables de entorno, esas vienen de docker
const mysqlhost = process.env.MYSQLHOST || '3306';
const mysqluser = process.env.MYSQLUSER || "root";
const mysqlpass = process.env.MYSQLPASS || "admin";
const mysqldb = process.env.MYSQLPASS || "Practica";
//paquete
const mysql = require('mysql');
//conexión
const con = mysql.createConnection({
    host: mysqlhost,
    user: mysqluser,
    password: mysqlpass,
    database: mysqldb
});