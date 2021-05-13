package it.unisa.model;

import java.io.Serializable;
import java.util.Date;

public class OrdineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public OrdineBean() {

	}
	
	public int getIdOrdine() {
		return idOrdine;
	}
	
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public double getImportoTotale() {
		return importoTotale;
	}
	
	public void setImportoTotale(double importoTotale) {
		this.importoTotale = importoTotale;
	}
	
	public String getStato() {
		return stato;
	}
	
	public void setStato(String stato) {
		this.stato = stato;
	}
	
	public Date getData() {
		return data;
	}
	
	public void setData(Date data) {
		this.data = data;
	}

	private int idOrdine;
	private String email;
	private double importoTotale;
	private String stato;
	private Date data;
	
}