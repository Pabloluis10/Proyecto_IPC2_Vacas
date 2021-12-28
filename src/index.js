const express = require('express');
const app = express();
const path = require('path');

//app setting
app.set('port', 3000);

app.use(express.static('public'));

app.use('/css', express.static(__dirname+'public/css'));
app.use('/imagenes', express.static(__dirname+'public/imagenes'));
app.use('/javaScript', express.static(__dirname+'public/javaScript'));


app.get('/', (req, res) => {
    console.log ("verificar que exista el o los usuario en la base de datos");
    res.status(201).sendFile(path.join(__dirname, './views/Pagina.html'));
});

app.get('/RegitroPacientes', (req, res) => {
    console.log ("verificar que el sistema tenga un apartado o base de datos donde guardar la información del cliente");
    res.status(201).sendFile(path.join(__dirname, './views/IngresoClientes.html'));
});

app.get('/Administrador', (req, res) => {
    console.log ("verificar el usuario en la base de datos");
    res.status(201).sendFile(path.join(__dirname, './views/Administrador.html'));
});

app.get('/CrearExamen', (req, res) => {
    console.log ("verificar la base de datos para agregar un examen");
    res.status(201).sendFile(path.join(__dirname, './views/CrearExamen.html'));
});

app.get('/CrearUsuario', (req, res) => {
    console.log ("verificar la base de datos para agregar un Usuario");
    res.status(201).sendFile(path.join(__dirname, './views/CrearUsuario.html'));
});

app.get('/EditarExamen', (req, res) => {
    console.log ("verificar la base de datos de los exmanes");
    res.status(201).sendFile(path.join(__dirname, './views/EditarExamen.html'));
});

app.get('/EditarUsuario', (req, res) => {
    console.log ("verificar la base de datos para editar un usuario");
    res.status(201).sendFile(path.join(__dirname, './views/EditarUsuario.html'));
});

app.get('/EliminarExamen', (req, res) => {
    console.log ("verificar la base de datos de los exmanes para eliminar");
    res.status(201).sendFile(path.join(__dirname, './views/EliminarExamen.html'));
});

app.get('/EliminarUsuario', (req, res) => {
    console.log ("Obtener los datos de los usuario de la base de datos para eliminar");
    res.status(201).sendFile(path.join(__dirname, './views/EliminarUsuario.html'));
});

app.get('/Laboratorista', (req, res) => {
    console.log ("Obtener la informacion del laboratorista en la base de datos del sistema");
    res.status(201).sendFile(path.join(__dirname, './views/Laboratorista.html'));
});

app.listen(app.get('port'), () => {
    console.log('port', app.get('port'));
});