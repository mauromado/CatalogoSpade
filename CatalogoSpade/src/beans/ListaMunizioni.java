package beans;

import java.util.ArrayList;
import java.util.List;

public class ListaMunizioni {
	private List<Munizioni> listaNomiMunizioni = new ArrayList<Munizioni>();
	
	public ListaMunizioni(List<Munizioni> listaNomiMunizioni) {
		super();
		this.listaNomiMunizioni = listaNomiMunizioni;
	}
		
	public ListaMunizioni() {
	}

	public List<Munizioni> getListaNomiMunizioni() {
		return listaNomiMunizioni;
	}

	public void setListaNomiMunizioni(List<Munizioni> listaNomiMunizioni) {
		this.listaNomiMunizioni = listaNomiMunizioni;
	}
	
}
