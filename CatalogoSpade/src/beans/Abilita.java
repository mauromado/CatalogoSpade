package beans;

public class Abilita {
	private String nome;
	private String descrizione;
	private String tipologiaArma;
	
	public Abilita(String nome, String descrizione,String tipologiaArma){
		super();
		this.nome = nome;
		this.descrizione = descrizione;
		this.tipologiaArma = tipologiaArma;
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
	
	public String getTipologiaArma() {
		return tipologiaArma;
	}

	public void setTipologiaArma(String tipologiaArma) {
		this.tipologiaArma = tipologiaArma;
	}

	public String toString() {
		return "Abilita [nome=" + nome + ", descrizione=" + descrizione + "]";
	}
	
	
}
