/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateForm(){
    var usu=document.getElementById('usuario').value;
    var passwd=document.getElementById('password').value;
    var passwd2=document.getElementById('password2').value;
    var nombre=document.getElementById('nombre').value;
    var apellido=document.getElementById('apellido').value;
    var email=document.getElementById('email').value;
    
    if(usu===undefined||passwd===undefined||usu===''||passwd===''||passwd2===undefined
            ||passwd2===''||nombre===undefined||nombre===''||apellido===undefined
            ||apellido===''||email===undefined||email===''){
        alert('Rellene los campos');
        return false;
    }else if(passwd!==passwd2){
        //alert('Las contraseñas no coinciden');
        document.getElementById("error").innerHTML = "Las contraseñas no coinciden";
        return false;
    }else{
        return true;
    }
}