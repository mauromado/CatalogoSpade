package beans;

public class Munizioni {
	private String nome;
	private String descrizione;
	private Float danno;
	private String tipoDanno;
	
	public Munizioni(String nome, String descrizione, Float danno, String tipoDanno) {
		super();
		this.nome = nome;
		this.descrizione = descrizione;
		this.danno = danno;
		this.tipoDanno = tipoDanno;
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
	public Float getDanno() {
		return danno;
	}
	public void setDanno(Float danno) {
		this.danno = danno;
	}
	public String getTipoDanno() {
		return tipoDanno;
	}
	public void setTipoDanno(String tipoDanno) {
		this.tipoDanno = tipoDanno;
	}
	
	
}
