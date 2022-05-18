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

	function containsSpecialChars(myField){
		const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		if(specialChars.test(myField)) {
			return true;
		} else {
			return false;
		}
		 
	}

	function checkNome(theForm){
		var corrept = true;
		if (nonBlank(theForm.nome)){
			var tempStr = new String(theForm.nome.value);
			for (let i = 0; i < tempStr.length; i++){
				if ((isNaN(tempStr.charAt(i)) && !containsSpecialChars(tempStr)) || tempStr.charAt(i) == " " ){
					corrept = true;
				} else {
				corrept = false;
				alert("Il nome dell'arma non può contenere caratteri speciali!");
				}
			}
		}
		return corrept;
	}		

