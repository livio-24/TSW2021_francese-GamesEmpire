package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface ProdottoDaoInterfaccia {

	public void doSave(ProdottoBean prodotto) throws SQLException;

	public boolean doDelete(int idProdotto) throws SQLException;

	public ProdottoBean doRetrieveByKey(int idProdotto) throws SQLException;
	
	public Collection<ProdottoBean> doRetrieveAll(String order) throws SQLException;
}