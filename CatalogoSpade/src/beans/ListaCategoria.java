package beans;

import java.util.ArrayList;
import java.util.List;

public class ListaCategoria {
	private List<String> listaNomiCategorie = new ArrayList<String>();

	public ListaCategoria(List<String> listaNomiCategorie) {
		super();
		this.listaNomiCategorie = listaNomiCategorie;
	}
	
	public ListaCategoria() {
	}
	
	public List<String> getListaNomiCategorie() {
		return listaNomiCategorie;
	}

	public void setListaNomiCategorie(List<String> listaNomiCategorie) {
		this.listaNomiCategorie = listaNomiCategorie;
	}
	
}
