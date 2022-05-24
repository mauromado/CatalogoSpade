package beans;

public class Abilita {
	private String nome;
	private String descrizione;
	
	public Abilita(String nome, String descrizione){
		super();
		this.nome = nome;
		this.descrizione = descrizione;
	}
	
	public Abilita() {
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

	public String toString() {
		return "Abilita [nome=" + nome + ", descrizione=" + descrizione + "]";
	}
	
	
}
