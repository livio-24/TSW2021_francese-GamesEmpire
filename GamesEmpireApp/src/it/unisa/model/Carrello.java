package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {
	
	
	public Carrello() {
		prodotti = new ArrayList<ItemCarrello>();
	}
	
	public void addProdotto(int idProdotto) {
		for(ItemCarrello item : prodotti) {
			if(item.getId() == idProdotto) {
				item.incrementa();
				return;
			}
		}
		
		ProdottoBean prod = null;
		ArrayList <ProdottoBean> products = request.getAttribute("products");
		for(ProdottoBean prodotto : products) {
			if(prodotto.getIdProdotto() == idProdotto)
				prod = prodotto;
		}
		
		ItemCarrello item = new ItemCarrello(prod);
		prodotti.add(item);
	}
	
	
	public void deleteProdotto(int idProdotto) {
		for(ItemCarrello prod : prodotti) {
			if(prod.getId() == idProdotto) {
				prodotti.remove(prod);
				break;
			}
		}
 	}
	
	
	public double calcolaCosto() {
		double tot = 0;
		for(ItemCarrello prod : prodotti)
			tot += prod.getTotalPrice();
		
		return tot;	
	}
	
	
	public List<ItemCarrello> getProdotti() {
		return  prodotti;
	}
	
	
	private List<ItemCarrello> prodotti;
}