// JavaScript Document

var modal = document.getElementById('loginModal');

var modalBtn = document.getElementById('loginModalBTN');

var closeBtn = document.getElementById('closeBTN');

//var serverMessage = ${coursesList};
//var serverMessage = ${coursesList};

//modalBtn.addEventListener('click', openModal);
closeBtn.addEventListener('click', closeModal);
window.addEventListener('click', clickOutside);



//Function openModal
function openModal(){
	"use strict";
	modal.style.display = 'block';
}

function closeModal(){
	"use strict";
	modal.style.display = 'none';
}

function clickOutside(e){
	"use strict";
	if(e.target === modal){
		modal.style.display = 'none';
	}
}