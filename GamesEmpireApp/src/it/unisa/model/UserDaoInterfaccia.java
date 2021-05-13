package it.unisa.model;

import java.sql.SQLException;

public interface UserDaoInterfaccia {

	public void doSave(UserBean user) throws SQLException;
	
	public UserBean doRetrive(String username, String password) throws SQLException;
}