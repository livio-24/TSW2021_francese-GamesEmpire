package it.unisa.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdineDao implements OrdineDaoInterfaccia {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/storage");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "ordine";

	
	@Override
	public synchronized void doSave(OrdineBean ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineDao.TABLE_NAME
				+ " (EMAIL, IMPORTO_TOTALE, STATO, DATA) VALUES (?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, ordine.getEmail());
			preparedStatement.setDouble(2, ordine.getImportoTotale());
			preparedStatement.setString(3, ordine.getStato());
			preparedStatement.setDate(4, (Date) ordine.getData());

			preparedStatement.executeUpdate();

			connection.commit();
		} 
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	
	@Override
	public synchronized OrdineBean doRetrieveByKey(int idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrdineBean ordine = new OrdineBean();

		String selectSQL = "SELECT * FROM " + OrdineDao.TABLE_NAME 
						+ " WHERE ID_ORDINE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getDate("DATA"));
			}

		} 
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return ordine;
	}
	
	
	@Override
	public synchronized ArrayList<OrdineBean> doRetrieveByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();
		
		String selectSQL = "SELECT * FROM " + OrdineDao.TABLE_NAME
						+ " WHERE EMAIL = ? ";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getDate("DATA"));
				ordini.add(ordine);
			}
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return ordini;
	}
	
	
	@Override
	public synchronized ArrayList<OrdineBean> doRetrieveAll(String order) throws SQLException {
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<OrdineBean> ordini = new ArrayList<OrdineBean>();

		String selectSQL = "SELECT * FROM " + OrdineDao.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				OrdineBean ordine = new OrdineBean();
				ordine.setIdOrdine(rs.getInt("ID_ORDINE"));
				ordine.setEmail(rs.getString("EMAIL"));
				ordine.setImportoTotale(rs.getDouble("IMPORTO_TOTALE"));
				ordine.setStato(rs.getString("STATO"));
				ordine.setData(rs.getDate("DATA"));
				ordini.add(ordine);
			}
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return ordini;
	}

}