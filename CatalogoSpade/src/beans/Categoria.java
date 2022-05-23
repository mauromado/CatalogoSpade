package beans;

public class Categoria {
	private String nome;
	private String descrizione;
	
	public Categoria(String nome, String descrizione) {
		super();
		this.nome = nome;
		this.descrizione = descrizione;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}	
}
