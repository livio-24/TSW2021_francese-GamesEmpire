package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.*;

/**
 * Servlet implementation class SpedizioneServlet
 */
@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdottoDao daoProd = new ProdottoDao();
		OrdineDao daoOrd = new OrdineDao();
		ComposizioneDao daoComp = new ComposizioneDao();
		
		UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
		OrdineBean ordine = new OrdineBean();
		ComposizioneBean comp = new ComposizioneBean();
	
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		Double prezzoTot = cart.calcolaCosto();
		
		Date now = new Date();
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String mysqlDateString = formatter.format(now);
		
		
		try {
			
			ordine.setEmail(user.getEmail());
			ordine.setIndirizzo(null);
			ordine.setCap(null);
			ordine.setCartaCredito(null);
			ordine.setData(mysqlDateString);
			ordine.setStato("confermato");
			ordine.setImportoTotale(prezzoTot);
			daoOrd.doSave(ordine);
			
			ArrayList<OrdineBean> ordini = daoOrd.doRetrieveByEmail(user.getEmail());
			int newId = ordini.get(ordini.size() - 1).getIdOrdine();
			
			
			for(int i = 0; i < cart.size() ; i++) {
				int qnt = cart.get(i).getQuantitàCarrello();
				ProdottoBean prod = cart.get(i).getProdotto();
				int newQnt = prod.getQuantità() - qnt;
		
				daoProd.doUpdateQnt(cart.get(i).getId(), newQnt);
				
				comp.setIdOrdine(newId);
				comp.setIdProdotto(cart.get(i).getId());
				comp.setPrezzoTotale(cart.get(i).getTotalPrice());
				comp.setIva(cart.get(i).getProdotto().getIva());
				comp.setQuantità(cart.get(i).getQuantitàCarrello());
				daoComp.doSave(comp);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			return;

		}
		
		request.getSession().removeAttribute("cart");
		
		response.sendRedirect(request.getContextPath() + "/Home.jsp");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

}
