const nombre = document.getElementById('name')
const apellido = document.getElementById('last_name')
const email = document.getElementById('email')
const phone = document.getElementById('phone')
const birthday = document.getElementById('birthday')
const password = document.getElementById('password')
const genre = document.getElementById('genre')
const form = document.getElementById('register-form')
const parrafo = document.getElementById('warnings')

form.addEventListener("submit", e => {
    e.preventDefault()
    let warnings=""
    let entrar = false
    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    //parrafo.innerHTML = ""
    if (nombre.value.length == ''){
        warnings += 'Debes completar el campo nombre</br>'
        entrar= true
    } else if 
        (nombre.value.length <= 2) {
            warnings += 'El nombre debe tener al menos 2 carácteres <br>'
            entrar= true
    }

    if (apellido.value.length == ''){
        warnings += 'Debes completar el campo apellido </br>'
        entrar= true
    }
    else if 
        (nombre.value.length <= 2) {
            warnings += 'El apellido debe tener al menos 2 carácteres <br>'
            entrar= true
    }

    if (phone.value.length == ''){
        warnings += 'Debes completar el campo télefono</br>'
        entrar= true
    }
    if(!regexEmail.test(email.value)){
        warnings += 'Debes completar el campo email</br>'
        entrar= true
    }

    if (genre.value.length == ''){
        warnings += 'Introduce tu género</br>'
        entrar= true
    }

    if (password.value.length == ''){
        warnings += 'Debes completar el campo contraseña</br>'
        entrar= true
    } else if 
    (password.value.length <= 8) {
        warnings += 'La contraseña debe tener mínimo 8 caracteres</br>'
        entrar= true
}


    if(entrar){
        parrafo.innerHTML = warnings
    }
    else{
        parrafo.innerHTML = "Enviado"
    }
})