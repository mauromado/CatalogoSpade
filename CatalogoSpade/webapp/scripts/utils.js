function nonBlank(myField) {
    // Check for non-blank field
    var result = true;
    if ( myField.value == "") {
        alert("Please enter a value for the '" + myField.name + "' field.");
        myField.focus();
        result = false;
    }
    return result;
}

function containsSpecialChars(myField){
	const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
	return specilaChars.test(myField.value);
}

function checkNome(myField){
	if (nonBlank(myField)){
		var tempStr = new String(myField.value);
		for (let i = 0; i < tempStr.length; i++){
			if (!isNaN(tempStr.charAt(i)) && !containsSpecialChars(tempStr)){
				return true;
			}
		}
		return false;
	}
}		

