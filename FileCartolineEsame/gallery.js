function gestoreClickAvanti () {
      cambiaFoto(+1);
}

function gestoreClickIndietro () {
      cambiaFoto(-1);
}

function cambiaFoto (x) {
   indiceFoto += x;
   if (indiceFoto == NUMERO_FOTO) {
      indiceFoto = 0;
   }
   if (indiceFoto < 0) {
   indiceFoto = NUMERO_FOTO-1;
   }
   nodoFoto.setAttribute("src", galleria[indiceFoto]);
   scriviMessaggio (nodoMessaggio, messaggi[indiceFoto]);
}

function rimuoviFigli(nodo) {
  while (nodo.childNodes.length > 0) {
    nodo.removeChild(nodo.firstChild);
  }
}

function scriviMessaggio (nodo, messaggio) {
	rimuoviFigli(nodo);
	var nodoTesto = document.createTextNode(messaggio);
	nodo.appendChild(nodoTesto);
}

const NUMERO_FOTO = 6;
const RITARDO = 1500;
var galleria = ["img/067F.jpg", "img/067R.jpg", "img/187F.jpg", "img/187R.jpg", "img/197F.jpg", "img/197R.jpg"];
var messaggi = ["Fronte della Cartolina 067","Retro della Cartolina 067","Fronte della Cartolina 187","Retro della Cartolina 187","Fronte della Cartolina 197","Retro della Cartolina 197"];
var indiceFoto;
var nodoAvanti;
var nodoIndietro;
var nodoFoto;
var nodoMessaggio;

function gestoreLoad(){
    try {
        nodoAvanti = document.getElementById("avanti");
        nodoIndietro = document.getElementById("indietro");
        nodoFoto = document.getElementById("foto");
        nodoMessaggio = document.getElementById("messaggio");
        nodoAvanti.onclick = gestoreClickAvanti;
        nodoIndietro.onclick = gestoreClickIndietro;
        var nodoTesto = document.createTextNode("");
		nodoMessaggio.appendChild(nodoTesto);
        indiceFoto = 0;
        cambiaFoto(0);
    } catch (e) {
        alert("gestoreLoad "+e)
    }
}

window.onload=gestoreLoad;