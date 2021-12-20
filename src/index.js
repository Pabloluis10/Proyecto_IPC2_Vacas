const express = require('express');
const app = express();
const path = require('path');

//app setting
app.set('port', 3000);

app.use(express.static('public'));

app.use('/css', express.static(__dirname+'public/css'));
app.use('/imagenes', express.static(__dirname+'public/imagenes'));
app.use('javaScript', express.static(__dirname+'public/javaScript'));


app.get('/', (req, res) => {
    console.log ("verificar que exista el o los usuario en la base de datos");
    res.status(201).sendFile(path.join(__dirname, './views/Pagina.html'));
});

app.get('/RegitroPacientes', (req, res) => {
    console.log ("verificar que el sistema tenga un apartado o base de datos donde guardar la información del cliente");
    res.status(201).sendFile(path.join(__dirname, './views/IngresoClientes.html'));
});

app.listen(app.get('port'), () => {
    console.log('port', app.get('port'));
});