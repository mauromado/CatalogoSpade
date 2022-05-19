const scalingValue = ["Astr","Adex","Aint","Afth","Sstr","Sdex","Sint","Sfth","Bstr",
                      "Bdex","Bint","Bfth","Cstr","Cdex","Cint","Cfth","Dstr","Ddex",
                      "Dint","Dfth","Estr","Edex","Eint","Efth"];

function nonBlank(myField) {
	    // Check for non-blank field
	    var result = true;
	    if ( myField.value == "") {
	        alert("Il campo " + myField.name + " non deve essere vuoto!");
	        myField.focus();
	        result = false;
	    }
	    return result;
	}
	
	function checkOnlySpaces(str){
		return str.trim().length === 0;
	}

	function containsSpecialChars(myField){
		const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		if(specialChars.test(myField)) {
			return true;
		} else {
			return false;
		}
		 
	}
	
	
	function isCorrectScaling(theForm){
		var tempScaling = new String(theForm.scaling.value);
		const tempScalingArray = tempScaling.split(",");
		for(let i = 0; i < tempScalingArray.length; i++){
			if(!scalingValue.includes(tempScalingArray[i])){
				alert("Valore di scaling non valido!");
			}
		} 
	}

	function checkNome(theForm){
		var correct = true;
		if (nonBlank(theForm.nome)){
			var tempStr = new String(theForm.nome.value);
			if (checkOnlySpaces(tempStr)){
				correct = false;
				alert("Il nome dell'arma non e' corretto!");
			}
			for (let i = 0; i < tempStr.length; i++){
				if ((isNaN(tempStr.charAt(i)) && !containsSpecialChars(tempStr)) || tempStr.charAt(i) == " " ){
					correct = true;
				} else {
				correct = false;
				alert("Il nome dell'arma non puo' contenere caratteri speciali!");
				}
			}
		}
		return correct;
	}		

