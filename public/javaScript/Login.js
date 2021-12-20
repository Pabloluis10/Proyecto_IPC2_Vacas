const usuario = document.getElementById("username");
function mostrarDatos(){
    swal({
        title: 'Datos de usuario',
        text: 'Ha ingresado como el usuario '+usuario.value,
        icon: 'success',
    }) 
}
