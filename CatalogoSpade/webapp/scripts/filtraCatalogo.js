let myTabella;
let matrixElement = new Array();
let currentArmi = 0;
let statoSelectCategoria = "tutto";
let statoSelectAbilita = "tutto";

function getTabella(){
	myTabella=document.getElementById("tabellaArmi");
	for(let x = 2; x<myTabella.rows.length-1 ; x++){
		tempArr= new Array();
		tempArr.push(myTabella.rows[x].cells[0].innerHTML);
		tempArr.push(myTabella.rows[x].cells[1].innerHTML);
		tempArr.push(myTabella.rows[x].cells[2].innerHTML);
		tempArr.push(myTabella.rows[x].cells[3].innerHTML);
		matrixElement.push(tempArr);
	}
	currentArmi=matrixElement.length;
}

function clearTabella(){
	for(let x = 0; x<currentArmi ; x++){
		myTabella.deleteRow(2);	
	}
	currentArmi = 0;
}

function setStatoSelectCategoria(newStatoSelectCategoria){
	statoSelectCategoria = newStatoSelectCategoria;
	aggiornamentoTabella();
}

function setStatoSelectAbilita(newStatoSelectAbilita){
	statoSelectAbilita = newStatoSelectAbilita;
	aggiornamentoTabella();
}

function aggiornamentoTabella(){
	clearTabella();
	let numberRow=2;
	for(let x = 0; x<matrixElement.length ; x++){
		if((statoSelectCategoria===matrixElement[x][1] || statoSelectCategoria==="tutto") 
		&& (statoSelectAbilita===matrixElement[x][2] || statoSelectAbilita==="tutto") ){
			let row = myTabella.insertRow(numberRow);
			if(numberRow%2==0)row.className="coloriDispari";
			else row.className="coloriPari";
			numberRow++;
			let cell0 = row.insertCell(0);
			let cell1 = row.insertCell(1);
			let cell2 = row.insertCell(2);
			let cell3 = row.insertCell(3);
			cell0.innerHTML = matrixElement[x][0];
			cell1.innerHTML = matrixElement[x][1];
			cell2.innerHTML = matrixElement[x][2];
			cell3.innerHTML = matrixElement[x][3];
			currentArmi++;
		}
	}
}
	



