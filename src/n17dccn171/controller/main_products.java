package n17dccn171.controller;

import java.util.ArrayList;
import java.util.Collections;
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
public class main_products {

	@Autowired
	SessionFactory factory;
	
	public void count_type_QuickMenu(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product";
		Query query = session.createQuery(hql);
		List<product> list = query.list();
		
		int count_MB = 0;
		int count_SB = 0;
		int count_FG = 0;
		int count_CB = 0;
		
		for(product item : list){
//			System.out.println(item);
			
			if(item.getType().trim().equals("MB")){
				count_MB++;
			}
			else if(item.getType().trim().equals("SB")){
				count_SB++;
			}
			else if(item.getType().trim().equals("FG")){
				count_FG++;
			}
			else if(item.getType().trim().equals("CB")){
				count_CB++;
			}
		}
		model.addAttribute("count_MB", count_MB);
		model.addAttribute("count_SB", count_SB);
		model.addAttribute("count_FG", count_FG);
		model.addAttribute("count_CB", count_CB);
	}
	
	public void send_special(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product ORDER BY price DESC";
		Query query = session.createQuery(hql);
		List<product> list = query.list();
		
		List<product> special = list.subList(0, 1);
		
		for(product item : special){
//			System.out.println(item);
			model.addAttribute("item_special", item);
		}
	}
	
	public void data_new_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product WHERE newproduct=1 ORDER BY discount";
		Query query = session.createQuery(hql);
		List<product> list_new_product = query.list();
		list_new_product = list_new_product.subList(0, 5);
//		for(product a:list_new_product){
//			System.out.println(a);
//		}
		model.addAttribute("list_new_product", list_new_product);
	}
	
	public void data_featured_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product ORDER BY discount DESC";
		Query query = session.createQuery(hql);
		List<product> list_featured = query.list();
		list_featured = list_featured.subList(0, 10);
//		for(product a:list_featured){
//			System.out.println(a);
//		}
		model.addAttribute("list_featured", list_featured);
	}
	
	class popular_cart{
		public int id_item;
		public int quantity;
		@Override
		public String toString() {
			return "popular_cart [id_item=" + id_item + ", quantity=" + quantity + "]";
		}
	}
	
	public void data_popular_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM cart";
		Query query = session.createQuery(hql);
		List<cart> list = query.list();
		
		List<Integer> arr1 = new ArrayList<Integer>();
		
		List<Integer> arr2 = new ArrayList<Integer>();
		
		for(cart a : list){
			if(arr1.indexOf(a.getId_item()) == -1){
				arr1.add(a.getId_item());
				arr2.add(1);
			}
			else{
				arr2.set(arr1.indexOf(a.getId_item()), arr2.get(arr1.indexOf(a.getId_item())) + 1);
			}
		}
		
//		for(int a : arr1){
//			System.out.print(a + " ");
//		}
//		System.out.println();
//		for(int a : arr2){
//			System.out.print(a + " ");
//		}
//		System.out.println();
		
		int[] arr3 = new int[3];
		arr3[0] = arr3[1] = arr3[2] = -1;
		
		for(int a = 0; a< arr2.size(); a++){
			int index = 1;
			for(int b = 0 ; b < arr2.size(); b++){
				if(arr2.get(a) < arr2.get(b)){
					index++;
				}
			}
//			System.out.println(index);
			if (index < 4){
				if(arr3[index-1] == -1){
					arr3[index-1] = arr1.get(a);
				}
				else{
					index++;
					while(arr3[index-1] != -1 && index < 4){
						index++;
//						System.out.print(index);
					}
					if(index < 4){
						arr3[index-1] = arr1.get(a);
					}
				}
			}
		}
		
//		for(int c : arr3){
//			System.out.print(c + " ");
//		}
		String hql1 = "FROM product WHERE id = " + arr3[0] + " or id = " + arr3[1] + " or id = " + arr3[2];
		Query query1 = session.createQuery(hql1);
		List<product> list1 = query1.list();
//		for(product i:list1){
//			System.out.println(i.toString());
//		}
//		
		model.addAttribute("list_popular", list1);
	}
	
	public List<product> search_string(List<product> arr, String search){
		List<product> arr_return = new ArrayList<product>();
		
		String[] arr_search = search.split(" ");
		
		for(String s : arr_search){
			for(product p : arr){
				if(p.getBrands().contains(s)){
					arr_return.add(p);
				}
				else if(p.getItemname().contains(s)){
					arr_return.add(p);
				}
				else if(p.getColor().contains(s)){
					arr_return.add(p);
				}
				else if(String.valueOf(p.getPrice()).contains(s)){
					arr_return.add(p);
				}
				else if(String.valueOf(p.getDiscount()).contains(s)){
					arr_return.add(p);
				}
				else if(String.valueOf(p.getReviews()).contains(s)){
					arr_return.add(p);
				}
				else if(p.getItemfullname().contains(s)){
					arr_return.add(p);
				}
				else if(p.getDescription().contains(s)){
					arr_return.add(p);
				}
			}
		}
		
		return arr_return;
	}
	
	public void data_find_product(ModelMap model, String type_find, String search){
		if(type_find == null || type_find.length() == 0){
			Session session = factory.getCurrentSession();
			String hql = "FROM product WHERE type = 'MB'";
			Query query = session.createQuery(hql);
			List<product> list_MB = query.list();
			
			hql = "FROM product WHERE type = 'SB'";
			query = session.createQuery(hql);
			List<product> list_SB = query.list();
			
			hql = "FROM product WHERE type = 'FG'";
			query = session.createQuery(hql);
			List<product> list_FG = query.list();
			
			hql = "FROM product WHERE type = 'CB'";
			query = session.createQuery(hql);
			List<product> list_CB = query.list();
			List<String> list_element = new ArrayList<String>();
			list_element.add("Mountant Bike");
			list_element.add("Sprort Bike");
			list_element.add("Fixed Gear Bike");
			list_element.add("Childrent's Bike");
			
			if(list_MB.size() > 6){
				list_MB = list_MB.subList(0, 6);
			}
			if(list_SB.size() > 6){
				list_SB = list_SB.subList(0, 6);
			}
			if(list_FG.size() > 6){
				list_FG = list_FG.subList(0, 6);
			}
			if(list_CB.size() > 6){
				list_CB = list_CB.subList(0, 6);
			}
			
			if(search != null && search.length() != 0){
				list_MB = search_string(list_MB, search);
				list_SB = search_string(list_SB, search);
				list_FG = search_string(list_FG, search);
				list_CB = search_string(list_CB, search);
			}
			
			model.addAttribute("list_element", list_element);
			model.addAttribute("list_e1", list_MB);
			model.addAttribute("list_e2", list_SB);
			model.addAttribute("list_e3", list_FG);
			model.addAttribute("list_e4", list_CB);
		}
		else{
			Session session = factory.getCurrentSession();
			String hql = "FROM product WHERE type = '" + type_find + "'";
			Query query = session.createQuery(hql);
			List<product> list_find = query.list();
			List<String> list_element = new ArrayList<String>();
			if(type_find.equals("MB")){
				list_element.add("Mountant Bike");
			}
			else if(type_find.equals("SB")){
				list_element.add("Sport Bike");
			}
			else if(type_find.equals("FG")){
				list_element.add("Fixed Gear Bike");
			}
			else if(type_find.equals("CB")){
				list_element.add("Childrent's Bike");
			}
			
			if(search != null && search.length() != 0){
				list_find = search_string(list_find, search);
			}
			
			model.addAttribute("list_element", list_element);
			model.addAttribute("list_e1", list_find);
		}
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
	
	@RequestMapping("products")
	public String products(ModelMap model, HttpServletRequest http){
		String accout_email = http.getParameter("accout_email");
		model.addAttribute("accout_email", accout_email);
		String type_find = http.getParameter("type_find");
		String search = http.getParameter("search");
		if(type_find != null){
			model.addAttribute("type_find", type_find);
		}
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		count_type_QuickMenu(model);
		send_special(model);
		data_new_product(model);
		data_featured_product(model);
		data_popular_product(model);
		
		data_find_product(model, type_find, search);
		
		return "products";
	}
	
}
