package it.unisa.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDao implements UserDaoInterfaccia {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/storage");

		} 
		catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "utente";
	
	
	@Override
	public synchronized void doSave(UserBean user) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UserDao.TABLE_NAME 
						+ " (NOME, COGNOME, USERNAME, PASSWORD, EMAIL, DATA_DI_NASCITA, CARTA_DI_CREDITO, INDIRIZZO, CAP, AMMINISTRATORE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getNome());
			preparedStatement.setString(2, user.getCognome());
			preparedStatement.setString(3, user.getUsername());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setDate(6, (Date) user.getDataDiNascita());
			preparedStatement.setInt(7, user.getCartaDiCredito());
			preparedStatement.setString(8, user.getIndirizzo());
			preparedStatement.setString(9, user.getCap());
			preparedStatement.setBoolean(10, user.isAmministratore());
		
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
	public synchronized UserBean doRetrive(String username, String password) throws SQLException {
		//preparing some objects for connecNon 
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UserBean user = new UserBean();
		
		String searchQuery = "select * from " + UserDao.TABLE_NAME 
							+ "	where username = ? '"
							+ "' AND password = ? '";
		
		try
			{
			//connect to DB 
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(searchQuery);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery(searchQuery);
			boolean more = rs.next();
			// if user does not exist set the isValid variable to false
				if (!more) 
					user.setValid(false);
		
				//if user exists set the isValid variable to true
				else if (more) 
				{
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setNome(rs.getString("nome"));
					user.setCognome(rs.getString("cognome"));
					user.setDataDiNascita(rs.getDate("data_di_nascita"));
					user.setCartaDiCredito(rs.getInt("carta_di_credito"));
					user.setIndirizzo(rs.getString("indirizzo"));
					user.setCap(rs.getString("cap"));
					user.setAmministratore(rs.getBoolean("amministratore"));
					user.setValid(true);
				}
			}
			catch (Exception ex) 
			{
				System.out.println("Log In failed: An Exception has occurred! " + ex); 
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

		return user;
	}

}