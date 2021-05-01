package it.unisa.model;

public class ItemCarrello {

	public ItemCarrello(ProdottoBean prodotto){
		this.prodotto = prodotto;
		quantit� = 1;
	}
	
	public ProdottoBean getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantit�() {
		return quantit�;
	}
	
	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
	}
	
	public int getId() {
		return prodotto.getIdProdotto();
	}
	
	public double getTotalPrice() {
		double tot = quantit� * prodotto.getPrezzo();
		return tot;
	}
	
	public String getDescription() {
		return prodotto.getDescrizione();
	}
	
	public void incrementa() {
		quantit� = quantit� + 1;
	}
	
	public void decrementa() {
		quantit� = quantit� + 1;
	}
	
	private ProdottoBean prodotto;
	private int quantit�;
}