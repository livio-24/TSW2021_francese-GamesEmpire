package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {
	
	
	public Carrello() {
		prodotti = new ArrayList<ItemCarrello>();
	}
	
	public void addProdotto(ProdottoBean prodotto) {
		for(ItemCarrello item : prodotti) {
			if(item.getId() == prodotto.getIdProdotto()) {
				item.incrementa();
				return;
			}
		}
		
		
		ItemCarrello item = new ItemCarrello(prodotto);
		prodotti.add(item);
	}
	
	
	public void deleteProdotto(ProdottoBean prodotto) {
		for(ItemCarrello prod : prodotti) {
			if(prod.getId() == prodotto.getIdProdotto()) {
				prodotti.remove(prod);
				break;
			}
		}
 	}
	
	public ItemCarrello getItem(int id) {
		
		for(ItemCarrello item : prodotti) {
			if(item.getId() == id)
				return item;
		}
		
		return null;
	}
	
	
	public double calcolaCosto() {
		double tot = 0;
		for(ItemCarrello prod : prodotti)
			tot += prod.getTotalPrice();
		
		return tot;	
	}
	
	
	public ArrayList<ItemCarrello> getProdotti() {
		return  prodotti;
	}
	
	public void svuota() {

		prodotti.removeAll(prodotti);
			
	}
	
	
	private ArrayList<ItemCarrello> prodotti;
}