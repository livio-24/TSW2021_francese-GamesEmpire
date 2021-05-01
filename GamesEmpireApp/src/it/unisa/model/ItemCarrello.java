package it.unisa.model;

public class ItemCarrello {

	public ItemCarrello(ProdottoBean prodotto){
		this.prodotto = prodotto;
		quantità = 1;
	}
	
	public ProdottoBean getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantità() {
		return quantità;
	}
	
	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}
	
	public int getId() {
		return prodotto.getIdProdotto();
	}
	
	public double getTotalPrice() {
		double tot = quantità * prodotto.getPrezzo();
		return tot;
	}
	
	public String getDescription() {
		return prodotto.getDescrizione();
	}
	
	public void incrementa() {
		quantità = quantità + 1;
	}
	
	public void decrementa() {
		quantità = quantità + 1;
	}
	
	private ProdottoBean prodotto;
	private int quantità;
}