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
import n17dccn171.entity.detail;
import n17dccn171.entity.product;

@Transactional
@Controller
public class main_details {

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
	
	public void data_series_link_product(String id, ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product WHERE id=" + id;
		Query query_product = session.createQuery(hql);
		List<product> list_product = query_product.list();
		for(product p:list_product){
			String[] series_link = p.getSeries_img().split("   ");
			int n = series_link.length;
			
			
			model.addAttribute("series_link",series_link);
			model.addAttribute("size_series", n);
		}
	}
	
	public String data_detail(String id, ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM detail WHERE id=" + id;
		Query query_detail = session.createQuery(hql);
		List<detail> list_detail = query_detail.list();
		
		String brands = "";
		
		for(detail p:list_detail){
			String[] link_img = p.getItemlink().trim().split("   ");
			String[] text = p.getItemtext().trim().split("   ");

			model.addAttribute("link_img",link_img);
			model.addAttribute("text", text);
			
			brands = p.getBrands().trim();
		}
		return brands;
	}
	
	public void data_related_product(String brands, ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product WHERE brands='" + brands + "'";
		Query query_related = session.createQuery(hql);
		List<detail> list_related = query_related.list();
		
		model.addAttribute("list_related", list_related);
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
	
	@RequestMapping("details")
	public String details(ModelMap model, HttpServletRequest http){
		String accout_email = http.getParameter("accout_email");
		model.addAttribute("accout_email", accout_email);
		String id = http.getParameter("id");
		String brands = "";
		
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		
		model.addAttribute("id_item_present", id);
		data_product("id=" + id, model);
		data_series_link_product(id, model);
		brands = data_detail(id, model);
		data_related_product(brands, model);
		
		return "details";
	}
}
