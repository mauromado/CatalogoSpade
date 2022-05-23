const scalingValue = ["Astr","Adex","Aint","Afth","Sstr","Sdex","Sint","Sfth","Bstr",
                      "Bdex","Bint","Bfth","Cstr","Cdex","Cint","Cfth","Dstr","Ddex",
                      "Dint","Dfth","Estr","Edex","Eint","Efth"];

var nomeCorrect=true;
var scalingCorrect=true;

function nonBlank(myField) {
	    // Check for non-blank field
	    if ( myField.value == "") {
	        alert("Il campo " + myField.name + " non deve essere vuoto!");
	        myField.focus();
	        return false;}
	    return true;}
		
function checkConcateneteSpace(str){
	let temp=false;
	for(let x = 0;x<str.length;x++){
		if(str.charAt(x) === " " && !temp) temp=true;
		else if(str.charAt(x) === " " && temp) return true;
		else temp=false;
    }
	return false;}

function containsSpecialChars(myField){
		const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		return specialChars.test(myField);
	}

function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}
	
function isCorrectScaling(theForm){
		if(theForm.scaling.value === ""){
			scalingCorrect = true;
			changeStateButton()
			return true;
		}
		var tempScaling = new String(theForm.scaling.value);
		const tempScalingArray = tempScaling.split(",");
		const alreadyIn= [];
		
		for(let i = 0; i < tempScalingArray.length; i++){
			const tempScalingPart = capitalize(tempScalingArray[i]);
			if(!scalingValue.includes(tempScalingPart) || alreadyIn.includes(tempScalingPart.substring(1,4))){
				alert("Valore di scaling non valido!");
				
				scalingCorrect = false;
				changeStateButton()
				
				return false;
			}
			alreadyIn.push(tempScalingPart.substring(1,4))
		}
		
		scalingCorrect = true; 
		changeStateButton()
	}

function checkNome(theForm){
	var correct = true;
	var tempStr = new String(theForm.nome.value);
	
	if (!nonBlank(theForm.nome)){
		
		nomeCorrect = false;
		changeStateButton()
		
		return false;}
	
	else if (tempStr.charAt(0)===" " || checkConcateneteSpace(tempStr)){
		alert("Il nome dell'arma non e' corretto!");
		
		nomeCorrect = false;
		changeStateButton()
		
		return false;
		}
		
	for (let i = 0; i < tempStr.length; i++){
		if ( !( (isNaN(tempStr.charAt(i)) && !containsSpecialChars(tempStr)) || tempStr.charAt(i) == " " ) ){
			alert("Il nome dell'arma non puo' contenere caratteri speciali!");
			
			nomeCorrect = false;
			changeStateButton()
			
			return false}
	}
	
	nomeCorrect = true;
	changeStateButton()
	
	return correct;
	
}
		

function checkNumber(form,min=0,max=1000){
	
	if(form.value < min){
		alert("il valore deve essere almeno "+min);
		form.value=min;}
		
	else if(form.value > max){
		alert("il valore deve essere massimo "+max);
		form.value=max;}
}

function changeStateButton(){
	const button = document.getElementById("insertButton");
	if(nomeCorrect && scalingCorrect)button.disabled = false;
	else button.disabled = true;
}

function successAlert(){
	return alert("Inserimento avvenuto con successo.");
}