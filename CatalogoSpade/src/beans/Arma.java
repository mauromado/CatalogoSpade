package beans;

public class Arma {
	
	private String nome;
	private float potenza;
	private float peso;
	private int livello;
	private String tipoDanno;
	private float stabilita;
	private int riduzioneDanno;
	private String scaling;
	private String nomeCategoria;
	private String nomeAbilita;
	
	public Arma(String nome, float potenza, float peso, int livello, String tipoDanno, float stabilita,
			int riduzioneDanno, String scaling, String nomeCategoria,String nomeAbilita){
		super();
		this.nome = nome;
		this.potenza = potenza;
		this.peso = peso;
		this.livello = livello;
		this.tipoDanno = tipoDanno;
		this.stabilita = stabilita;
		this.riduzioneDanno = riduzioneDanno;
		this.scaling = scaling;
		this.nomeCategoria = nomeCategoria;
		this.nomeAbilita = nomeAbilita;
	}
	
	public Arma() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getPotenza() {
		return potenza;
	}

	public void setPotenza(float potenza) {
		this.potenza = potenza;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public int getLivello() {
		return livello;
	}

	public void setLivello(int livello) {
		this.livello = livello;
	}

	public String getTipoDanno() {
		return tipoDanno;
	}

	public void setTipoDanno(String tipoDanno) {
		this.tipoDanno = tipoDanno;
	}

	public float getStabilita() {
		return stabilita;
	}

	public void setStabilita(float stabilita) {
		this.stabilita = stabilita;
	}

	public int getRiduzioneDanno() {
		return riduzioneDanno;
	}

	public void setRiduzioneDanno(int riduzioneDanno) {
		this.riduzioneDanno = riduzioneDanno;
	}

	public String getScaling() {
		return scaling;
	}

	public void setScaling(String scaling) {
		this.scaling = scaling;
	}
	
	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public void setNomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}
	
	public String getNomeAbilita() {
		return nomeAbilita;
	}

	public void setNomeAbilita(String nomeAbilita) {
		this.nomeAbilita = nomeAbilita;
	}

	public String toString() {
		return "nome=" + nome + ", potenza=" + potenza + ", peso=" + peso + ", livello=" + livello
				+ ", tipoDanno=" + tipoDanno + ", stabilita=" + stabilita + ", riduzioneDanno=" + riduzioneDanno
				+ ", scaling=" + scaling + ", NomeCategoria=" + nomeCategoria;
	}
	
	public boolean equals(Arma comp_arma) {
		return this.nome.equals(comp_arma.nome);
	}
	
	
	
	

}
