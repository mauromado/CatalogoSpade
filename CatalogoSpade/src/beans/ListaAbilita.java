package beans;

import java.util.ArrayList;
import java.util.List;

public class ListaAbilita {
	private List<Abilita> listaAbilita = new ArrayList<Abilita>();

	public ListaAbilita(List<Abilita> listaAbilita) {
		super();
		this.listaAbilita = listaAbilita;
	}
	
	public ListaAbilita() {
	}
	
	public List<Abilita> getListaAbilita() {
		return listaAbilita;
	}

	public void setListaAbilita(List<Abilita> listaAbilita) {
		this.listaAbilita = listaAbilita;
	}
}
