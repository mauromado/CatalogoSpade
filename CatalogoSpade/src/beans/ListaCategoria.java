package beans;

import java.util.ArrayList;
import java.util.List;

public class ListaCategoria {
	private List<Categoria> listaNomiCategorie = new ArrayList<Categoria>();

	public ListaCategoria(List<Categoria> listaNomiCategorie) {
		super();
		this.listaNomiCategorie = listaNomiCategorie;
	}
	
	public ListaCategoria() {
	}
	
	public List<Categoria> getListaNomiCategorie() {
		return listaNomiCategorie;
	}

	public void setListaNomiCategorie(List<Categoria> listaNomiCategorie) {
		this.listaNomiCategorie = listaNomiCategorie;
	}
	
}
