/**
 * 
 */
function checkNomeCognome(inputtxt) {
	var nome = /^[A-Za-z]+$/;
	if(inputtxt.value.match(nome)) 
		return true

	return false;	
}


function checkEmail(inputtxt) {
	var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(inputtxt.value.match(email)) 
		return true;
	
	return false;	
}


function checkData(inputtxt) {
	var data =  /^\d{1,2}-\d{1,2}-\d{4}$/;
	if(inputtxt.value.match(data)) 
		return true;
	
	return false;	
}


function checkUserName(inputtxt) {
	var userName = /^[A-Za-z0-9]+$/;
	if(inputtxt.value.match(userName)) 
		return true;
	
	return false;	
}


function checkPassword(inputtxt) {
	var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
	if(inputtxt.value.match(password)) 
		return true;
	
	return false;	
}


function validate(obj) {	
	var valid = true;	
	
	var nome = document.getElementsByName("nome")[0];
	if(!checkNomeCognome(nome)) {
		valid = false;
		nome.classList.add("error");
	} else {
		nome.classList.remove("error");
	}
	
	var cognome = document.getElementsByName("cognome")[0];
	if(!checkNomeCognome(cognome)) {
		valid = false;
		cognome.classList.add("error");
	} else {
		cognome.classList.remove("error");
	}
	
	var email = document.getElementsByName("email")[0];
	if(!checkEmail(email)) {
		valid = false;
		email.classList.add("error");
	} else {
		email.classList.remove("error");
	}		
	
	var data = document.getElementsByName("nascita")[0];
	if(!checkData(data)) {
		valid = false;
		data.classList.add("error");
	} else {
		data.classList.remove("error");
	}
	
	var user = document.getElementsByName("un")[0];
	if(!checkUserName(user)) {
		valid = false;
		user.classList.add("error");
	} else {
		user.classList.remove("error");
	}
	
	var pw = document.getElementsByName("pw")[0];
	if(!checkPassword(pw)) {
		valid = false;
		pw.classList.add("error");
	} else {
		pw.classList.remove("error");
	}		
	
	
	if(valid) 
		obj.submit();	
}


function myFunction(x) {
  		x.style.background = "yellow";
		}
		