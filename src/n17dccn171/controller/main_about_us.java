package n17dccn171.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import n17dccn171.entity.about_us;
import n17dccn171.entity.cart;
import n17dccn171.entity.product;

@Transactional
@Controller
public class main_about_us {

	@Autowired
	SessionFactory factory;
	
	public void data_about_us(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM about_us";
		Query query = session.createQuery(hql);
		List<about_us> list = query.list();
		
		model.addAttribute("list", list);
	}
	
	public void add_to_cart(String to_cart, String accout_email){
		if(to_cart != null && to_cart.length() > 0){
			String[] arr = to_cart.trim().split("   ");
			
			Session session = factory.getCurrentSession();
			String hql = "FROM product";
			Query query = session.createQuery(hql);
			List<product> list = query.list();
			
			for(String s : arr){
				for(product p : list){
					if(p.getId() == Integer.parseInt(s)){
//						System.out.println(s);
						cart cart = new cart();
						cart.setBrands(p.getBrands());
						cart.setEmail(accout_email);
						cart.setId_item(p.getId());
						cart.setItemname(p.getItemname());
						cart.setLinkimg(p.getLinkimg());
						cart.setPrice(p.getPrice());
						cart.setQuantity(0);
						cart.setShipping("false");
						
//						System.out.println(cart);
						
						Session session1 = factory.openSession();
						Transaction t = session1.beginTransaction();
						try {
							session1.save(cart);
							t.commit();
//							System.out.println("Thêm mới thành công!");
						}catch(Exception e)
						{
							t.rollback();
//							System.out.println("Thêm mới thất bại!");
						}finally {
//							session.close();
						}
					}
				}
			}
		}
	}
	
	@RequestMapping("about_us")
	public String about_us(ModelMap model, HttpServletRequest http){
		String accout_email = http.getParameter("accout_email");
		
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		
		model.addAttribute("accout_email", accout_email);
		data_about_us(model);
		return "about_us";
	}
}
