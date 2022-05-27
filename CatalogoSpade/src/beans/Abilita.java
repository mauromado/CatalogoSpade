package beans;

public class Abilita {
	private String nome;
	private String descrizione;
	private String nomeCategoria;
	
	public Abilita(String nome, String descrizione,String nomeCategoria){
		super();
		this.nome = nome;
		this.descrizione = descrizione;
		this.nomeCategoria = nomeCategoria;
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
	
	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public void setNomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}

	public String toString() {
		return "Abilita [nome=" + nome + ", descrizione=" + descrizione + "]";
	}
	
	
}
