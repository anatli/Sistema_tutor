/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function moverImg(){
    var lefti=document.getElementById("imagenAnimacion").style.left;
    var righti=document.getElementById("imagenAnimacion").style.right;
    if(lefti!=="1100px"){
        document.getElementById("imagenAnimacion").style.left="1100px";
    }else{
        document.getElementById("imagenAnimacion").style.left="100px";

    }
}


