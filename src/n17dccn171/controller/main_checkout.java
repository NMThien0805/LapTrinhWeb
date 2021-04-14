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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import n17dccn171.entity.cart;
import n17dccn171.entity.code_event;
import n17dccn171.entity.product;
import n17dccn171.entity.register;

@Transactional
@Controller
public class main_checkout {

	@Autowired
	SessionFactory factory;
	
	public ArrayList<String> send_63ProvinceCity(ModelMap model){
		ArrayList<String> provinceCity = new ArrayList<String>();

		provinceCity.add("An Giang");
		provinceCity.add("Bà rịa – Vũng tàu");
		provinceCity.add("Bắc Giang");
		provinceCity.add("Bắc Kạn");
		provinceCity.add("Bạc Liêu");
		provinceCity.add("Bắc Ninh");
		provinceCity.add("Bến Tre");
		provinceCity.add("Bình Định");
		provinceCity.add("Bình Dương");
		provinceCity.add("Bình Phước");
		provinceCity.add("Bình Thuận");
		provinceCity.add("Cà Mau");
		provinceCity.add("Cần Thơ");
		provinceCity.add("Cao Bằng");
		provinceCity.add("Đà Nẵng");
		provinceCity.add("Đắk Lắk");
		provinceCity.add("Đắk Nông");
		provinceCity.add("Điện Biên");
		provinceCity.add("Đồng Nai");
		provinceCity.add("Đồng Tháp");
		provinceCity.add("Gia Lai");
		provinceCity.add("Hà Giang");
		provinceCity.add("Hà Nam");
		provinceCity.add("Hà Nội");
		provinceCity.add("Hà Tĩnh");
		provinceCity.add("Hải Dương");
		provinceCity.add("Hải Phòng");
		provinceCity.add("Hậu Giang");
		provinceCity.add("Hòa Bình");
		provinceCity.add("Hưng Yên");
		provinceCity.add("Khánh Hòa");
		provinceCity.add("Kiên Giang");
		provinceCity.add("Kon Tum");
		provinceCity.add("Lai Châu");
		provinceCity.add("Lâm Đồng");
		provinceCity.add("Lạng Sơn");
		provinceCity.add("Lào Cai");
		provinceCity.add("Long An");
		provinceCity.add("Nam Định");
		provinceCity.add("Nghệ An");
		provinceCity.add("Ninh Bình");
		provinceCity.add("Ninh Thuận");
		provinceCity.add("Phú Thọ");
		provinceCity.add("Phú Yên");
		provinceCity.add("Quảng Bình");
		provinceCity.add("Quảng Nam");
		provinceCity.add("Quảng Ngãi");
		provinceCity.add("Quảng Ninh");
		provinceCity.add("Quảng Trị");
		provinceCity.add("Sóc Trăng");
		provinceCity.add("Sơn La");
		provinceCity.add("Tây Ninh");
		provinceCity.add("Thái Bình");
		provinceCity.add("Thái Nguyên");
		provinceCity.add("Thanh Hóa");
		provinceCity.add("Thừa Thiên Huế");
		provinceCity.add("Tiền Giang");
		provinceCity.add("Thành phố Hồ Chí Minh");
		provinceCity.add("Trà Vinh");
		provinceCity.add("Tuyên Quang");
		provinceCity.add("Vĩnh Long");
		provinceCity.add("Vĩnh Phúc");
		provinceCity.add("Yên Bái");
		
		model.addAttribute("provinceCity", provinceCity);
		return provinceCity;
	}
	
	public ArrayList<String> send_country(ModelMap model){
		ArrayList<String> country = new ArrayList<String>();
		
		country.add("VietNam");
		country.add("China");
		country.add("England");
		country.add("Iceland");
		country.add("France");
		country.add("Germany");
		country.add("Italy");
		country.add("Russia");
		country.add("United States");
		country.add("Brazil");
		country.add("India");
		country.add("Japan");
		
		model.addAttribute("country", country);
		return country;
	}
	
	public void data_checkout(ModelMap model, String accout_email){
		Session session = factory.getCurrentSession();
		String hql = "FROM cart WHERE email = '" + accout_email +"' and shipping = 'false'";
		Query query = session.createQuery(hql);
		List<cart> list_checkout = query.list();
		
		float total_all = 0;
		for(cart c:list_checkout){
			total_all = total_all + c.getPrice();
		}
		
		String text = "123";
		model.addAttribute("text_id_cart_send", text);
		model.addAttribute("total_all", total_all);
		model.addAttribute("list_checkout", list_checkout);
	}
	
	public cart get_cart(String dk){
		Session session = factory.getCurrentSession();
		String hql = "FROM cart WHERE " + dk;
//		System.out.println(hql);
		Query query = session.createQuery(hql);
		List<cart> list_checkout = query.list();
		for(cart cart : list_checkout)
			return cart;
		return null;
	}
	
	public void set_db_tbCart(String text_id_cart_send, String text_quantity){
		String[] arr = text_id_cart_send.trim().split("   ");
		String[] arr1 = text_quantity.trim().split("   ");
		for(int i = 0; i< arr.length; i++){
			cart c = new cart();
			c = get_cart("id_cart = '" + arr[i] + "'");
			if(c != null){
				c.setShipping("true");
				c.setQuantity(Integer.parseInt(arr1[i]));
			}
			else{
//				System.out.println("fail");
			}
		}
	}
	
	public void send_check_code(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM code_event";
		Query query = session.createQuery(hql);
		List<code_event> list_code_event = query.list();
		model.addAttribute("list_code_event", list_code_event);
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
	
	public void remove_item_cart(String remove_cart){
		cart item_remove = get_cart("id_cart = '" + remove_cart +"'");
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(item_remove);
			t.commit();
			System.out.println("Xóa thành công!");
		}catch(Exception e)
		{
			t.rollback();
			System.out.println("Xóa thất bại!");
		}finally {
			session.close();
		}
	}
	
	public void data_shipping(ModelMap model, String accout_email){
		Session session = factory.getCurrentSession();
		String hql = "FROM cart WHERE email = '" + accout_email +"' and shipping = 'true'";
		Query query = session.createQuery(hql);
		List<cart> list_shipping = query.list();
		
		float shipping_total_all = 0;
		for(cart c:list_shipping){
			shipping_total_all = shipping_total_all + c.getPrice()*c.getQuantity();
		}
		
		model.addAttribute("shipping_total_all", shipping_total_all);
		model.addAttribute("list_shipping", list_shipping);
	}
	
	public void send_address_phone(ModelMap model, String accout_email){
		Session session = factory.getCurrentSession();
		String hql = "FROM register WHERE email = '" + accout_email + "'";
		Query query = session.createQuery(hql);
		List<register> list = query.list();
		
		for(register r : list){
			model.addAttribute("address_old", r.getAddress());
			model.addAttribute("phone_old", "Mobile phone: " + r.getHomephone() + ", Mobile phone: " + r.getMobilephone());
		}
	}
	
	@RequestMapping("checkout")
	public String checkout(ModelMap model, HttpServletRequest http){
		
		send_63ProvinceCity(model);
		send_country(model);
		
		String accout_email = http.getParameter("accout_email");
		model.addAttribute("accout_email", accout_email);
		
		send_address_phone(model, accout_email);
		
		String remove_cart = http.getParameter("remove_cart");
		if(remove_cart != null && remove_cart.length() > 0){
			remove_item_cart(remove_cart);
			return "jump/jump_main_checkout";
		}
		
		String text_id_cart_send = http.getParameter("text_id_cart_send");
		String text_quantity = http.getParameter("text_quantity");
		
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		
		if(text_id_cart_send != null){
			set_db_tbCart(text_id_cart_send, text_quantity);
		}
		
		data_shipping(model, accout_email);
		data_checkout(model, accout_email);
		send_check_code(model);
		
//		System.out.println("Bua: " + text_id_cart_send);
		return "checkout";
	}
}
