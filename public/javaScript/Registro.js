//datos del usuari
const nombre = document.getElementById("name");
const apellido = document.getElementById("apellido");
const edad = document.getElementById("edad")
//listado de usuarios
const listado = document.getElementById("listado");

function registrar() {
     swal({
        title: 'Datos del cliente Ingresado',
        text: 'Ha ingresado al cliente '+nombre.value+' '+apellido.value+' con '+edad.value+' años',
        icon: 'success',
    }) 
	listado.innerHTML = listado.innerHTML + "<li>"+nombre.value+" "+apellido.value+" "+edad.value+"</li>"
}