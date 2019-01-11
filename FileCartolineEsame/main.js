$(document).ready(function(){
     $("select[id=pulsanti]").click(FronteRetro);
     $("input[name=radioPie]:radio").click(FronteRetro);
     $("#button").click(Conta1);
     $("#button2").click(Conta2);
     $(".CursorePointer").mouseover(Highlight);
     $(".CursorePointer").mouseout(UnHighlight);
     $(".popup").mouseover(PopUp);
     $(".popup").mouseout(NoPopUp);
})

var n = 0;

//funzione per pulsanti "altre informazioni" e "galleria cartoline"
function Conta1(){
    n=n+1;
    if (n%2==1){
        Informazioni();
    }
    else {
        Cartoline();
    }
}

function Conta2(){
    n=n+1;
    if (n%2==1){
        Galleria();
    }
    else {
        Cartoline2();
    }
}

//funzioni per evidenziare le righe
function Highlight(item){
    $(item).css("color", "red");
    
}
function UnHighlight(item){
    $(item).css("color", "black");    
}

function Informazioni(){
    $(".divimgcod").hide();
    $("#info").show(500);
    $("#boxGalleria").hide();
    $("#buttons").css("visibility","hidden");
    $("#button2").css("visibility","hidden");
}

function Galleria(){
    $(".divimgcod").hide();
    $("#boxGalleria").show(500);
    $("#info").hide();
    $("#buttons").css("visibility","hidden");
    $("#button").css("visibility","hidden");
}

function Cartoline(){
    $("#info").hide(500);
    $("#boxGalleria").hide();
    $("#buttons").css("visibility","visible");
    $("#button2").css("visibility","visible");
    FronteRetro();
}

function Cartoline2(){
    $(".divimgcod").hide();
    $("#boxGalleria").hide();
    $("#buttons").css("visibility","visible");
    $("#button").css("visibility","visible");
    FronteRetro();
}
  
function FronteRetro(){
    var cartoline= $("select[id=pulsanti]").val();
    var fronteretro= $("input[type=radio][name=radioPie]:checked").val();
    if (cartoline=="Cart1" && fronteretro=="Fronte"){
        $("#fronte1").css("display","block");
        $("#retro1").css("display","none");
        $("#fronte2").css("display","none");
        $("#retro2").css("display","none");
        $("#fronte3").css("display","none");
        $("#retro3").css("display","none");
        $("#info").css("display","none");
       
    }
    if (cartoline=="Cart2" && fronteretro=="Fronte"){
        $("#fronte1").css("display","none");
        $("#retro1").css("display","none");
        $("#fronte2").css("display","block");
        $("#retro2").css("display","none");
        $("#fronte3").css("display","none");
        $("#retro3").css("display","none");
        $("#info").css("display","none");
    }
     if (cartoline=="Cart3" && fronteretro=="Fronte"){
         $("#fronte1").css("display","none");
        $("#retro1").css("display","none");
        $("#fronte2").css("display","none");
        $("#retro2").css("display","none");
        $("#fronte3").css("display","block");
        $("#retro3").css("display","none");
        $("#info").css("display","none");
    }
    if (cartoline=="Cart1" && fronteretro=="Retro"){
        $("#fronte1").css("display","none");
        $("#retro1").css("display","block");
        $("#fronte2").css("display","none");
        $("#retro2").css("display","none");
        $("#fronte3").css("display","none");
        $("#retro3").css("display","none");
        $("#info").css("display","none");
        }
     if (cartoline=="Cart2" && fronteretro=="Retro"){
        //h='F'
        $("#fronte1").css("display","none");
        $("#retro1").css("display","none");
        $("#fronte2").css("display","none");
        $("#retro2").css("display","block");
        $("#fronte3").css("display","none");
        $("#retro3").css("display","none");
        $("#info").css("display","none");
     }
     if (cartoline=="Cart3" && fronteretro=="Retro"){
        //h='F'
        $("#fronte1").css("display","none");
        $("#retro1").css("display","none");
        $("#fronte2").css("display","none");
        $("#retro2").css("display","none");
        $("#fronte3").css("display","none");
        $("#retro3").css("display","block");
        $("#info").css("display","none");
     }
  }
  
//funzione per il popup
 
function PopUp(item) {
  item.classList.toggle("show");
}
function NoPopUp(item) {
  item.classList.toggle("hide");
} 