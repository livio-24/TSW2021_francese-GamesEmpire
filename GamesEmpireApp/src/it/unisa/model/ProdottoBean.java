package it.unisa.model;

import java.io.Serializable;

public class ProdottoBean implements Serializable {

private static final long serialVersionUID = 1L;

	public ProdottoBean() {
		
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	
	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
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
	
	public int getQuantità() {
		return quantità;
	}
	
	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}
	
	public String getMarca() {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public int getAnno() {
		return anno;
	}
	
	public void setAnno(int anno) {
		this.anno = anno;
	}
	
	public boolean isInVendita() {
		return inVendita;
	}
	
	public void setInVendita(boolean inVendita) {
		this.inVendita = inVendita;
	}
	
	public String getIva() {
		return iva;
	}
	
	public void setIva(String iva) {
		this.iva = iva;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	@Override
	public String toString() {
		return nome + idProdotto + prezzo + descrizione + categoria + quantità + marca + anno +iva;
	}

	private int idProdotto;
	private String categoria;
	private String nome;
	private String descrizione;
	private int quantità;
	private	String marca;
	private int anno;
	private boolean inVendita;
	private String iva;
	private double prezzo;
}