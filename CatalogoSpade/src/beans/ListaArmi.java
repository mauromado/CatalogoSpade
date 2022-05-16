package beans;

import java.util.ArrayList;
import java.util.List;

public class ListaArmi {
	private List<Arma> listaArmi = new ArrayList<Arma>();

	public ListaArmi(List<Arma> listaArmi) {
		super();
		this.listaArmi = listaArmi;
	}
	
	public ListaArmi() {
	}

	public List<Arma> getListaArmi() {
		return listaArmi;
	}

	public void setListaArmi(List<Arma> listaArmi) {
		this.listaArmi = listaArmi;
	}
}
