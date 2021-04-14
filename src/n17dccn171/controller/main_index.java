package n17dccn171.controller;

import java.util.ArrayList;
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

import n17dccn171.entity.cart;
import n17dccn171.entity.product;

@Transactional
@Controller
public class main_index {

	@Autowired
	SessionFactory factory;
	
	public void data_product(String dieukien,ModelMap model){
		Session session = factory.getCurrentSession();
		String hql;
		if(dieukien.length()==0){
			hql = "FROM product";
		}else{
			hql = "FROM product WHERE " + dieukien;
		}	
		Query query = session.createQuery(hql);
		List<product> list_product = query.list();
		List<product_bonus>list_bonnus = new ArrayList<product_bonus>();
		List<String>start = new ArrayList<String>();
		
		//System.out.print(list_product.size());
		
		for(product p:list_product){
			String[] fullname = p.getItemfullname().trim().split("   ");
			String[] description = p.getDescription().trim().split("   ");
			
			product_bonus temp = new product_bonus();
			temp.setFullname1(fullname[0]);
			temp.setFullname2(fullname[1]);
			temp.setDescription1(description[0]);
			temp.setDescription2(description[1]);
			temp.setDescription3(description[2]);
			temp.setDescription4(description[3]);
			temp.setDescription5(description[4]);
			
			list_bonnus.add(temp);
			
			String temp_start = "<i class=\"icon-star\"></i>";
			for(int h=1;h<p.getReviews();h++){
				temp_start = temp_start + "<i class=\"icon-star\"></i>";
			}
			temp_start = temp_start + "<i class=\"icon-star-empty\"></i>";
			start.add(temp_start);
		}
		
		model.addAttribute("list_product", list_product);
		model.addAttribute("list_bonus",list_bonnus);
		model.addAttribute("start",start);
	}
	
	public void data_new_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product WHERE newproduct=1";
		Query query = session.createQuery(hql);
		List<product> list_new_product = query.list();
		model.addAttribute("list_new_product", list_new_product);
	}
	
	public void data_best_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product AS p ORDER BY p.reviews DESC";
		Query query = session.createQuery(hql);
		List<product> list_best_product = query.list();
		list_best_product =  list_best_product.subList(0, 30);
		model.addAttribute("list_best_product", list_best_product);
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
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpServletRequest http){
		String accout_email = http.getParameter("accout_email");
		model.addAttribute("accout_email", accout_email);
		data_product("discount>0", model);
		data_new_product(model);
		data_best_product(model);
		
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		
		return "index";
	}
}
