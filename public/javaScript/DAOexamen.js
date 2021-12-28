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
function datoExamen(){
con.connect(function(err){
    if(err) throw err;
    console.log("conexion exitosa");
    var sql="INSERT INTO Examen(nombre, categoria, MontoCosto, MontoPagar) VALUE ('STIVEN','SABER',32,12)";
    con.query(sql,function(err,resul){
        if(err) throw err;
        console.log("insertado")
    })

});
}
