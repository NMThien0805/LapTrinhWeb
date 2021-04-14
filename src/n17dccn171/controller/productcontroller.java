package n17dccn171.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import n17dccn171.entity.detail;
import n17dccn171.entity.product;

@Transactional
@Controller
@RequestMapping("/product/")
public class productcontroller {
	public void set_data(data_product data_product){
		data_product.getProduct().setItemfullname
		(data_product.getProduct_bonus().getFullname1() + "   " + data_product.getProduct_bonus().getFullname2());
		
		data_product.getProduct().setDescription
		(data_product.getProduct_bonus().getDescription1() + "   " + 
			data_product.getProduct_bonus().getDescription2() + "   " +
			data_product.getProduct_bonus().getDescription3() + "   " +
			data_product.getProduct_bonus().getDescription4() + "   " +
			data_product.getProduct_bonus().getDescription5());
		
		data_product.getProduct().setLinkimg
		("themes/images/" + data_product.getProduct().getBrands() + "/" +
			data_product.getProduct().getItemname() + "/" +
			data_product.getProduct().getBrands() + "_" +
			data_product.getProduct().getItemname() + ".jpg");
		String[] arr = data_product.getProduct().getColor().trim().split(",");
		String series = "";
		String temp = "themes/images/" + data_product.getProduct().getBrands() + "/" +
				data_product.getProduct().getItemname() + "/" +
				data_product.getProduct().getBrands() + "_" +
				data_product.getProduct().getItemname();
		for(String color:arr){
			if(color.trim().length() > 0){
				series = series + temp + color.trim() + ".jpg   ";
			}
		}
		data_product.getProduct().setSeries_img(series.trim());
	}
	
	public int count_element_text(String text, String where){
		return text.trim().split(where).length;
	}
	public int count_element_link(String link, String where){
		return link.trim().split(where).length-1;
	}
	
	public void Product_to_dataProduct(data_product data_product, product product){
		data_product.setProduct(product);
		String[] fname = data_product.getProduct().getItemfullname().trim().split("   ");
		String[] des = data_product.getProduct().getDescription().trim().split("   ");
		
		data_product.getProduct_bonus().setFullname1(fname[0]);
		data_product.getProduct_bonus().setFullname2(fname[1]);
		
		data_product.getProduct_bonus().setDescription1(des[0]);
		data_product.getProduct_bonus().setDescription2(des[1]);
		data_product.getProduct_bonus().setDescription3(des[2]);
		data_product.getProduct_bonus().setDescription4(des[3]);
		data_product.getProduct_bonus().setDescription5(des[4]);
		
		Session session = factory.getCurrentSession();
		String hql = "FROM detail WHERE id=" + data_product.getProduct().getId();
		Query query = session.createQuery(hql);
		List<detail> list = query.list();
		for(detail d:list){
			data_product.setCount_text(count_element_text(d.getItemtext().trim(), "   "));
			data_product.setCount_link(count_element_link(d.getItemlink().trim(), "   "));
		}
	}
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index_product")
	public String index_product(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product";
		Query query = session.createQuery(hql);
		List<product> list = query.list();
		model.addAttribute("list", list);
		return "product/index_product";
	}
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("data_product", new data_product());
		return "product/insert";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("data_product") data_product data_product)
	{
		set_data(data_product);
		
		//System.out.print(data_product);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(data_product.getProduct());
			t.commit();
			model.addAttribute("message", "Thêm mới thành công!");
		}catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại!");
		}finally {
			session.close();
		}
		
		String str = data_product.getProduct().getBrands().concat("   ")
						.concat(data_product.getProduct().getItemname()).concat("   ")
						.concat(String.valueOf(data_product.getCount_text())).concat("   ")
						.concat(String.valueOf(data_product.getCount_link()));
						
		model.addAttribute("b_n_ct_cl", str);
		return "jump/jump_insert";
	}
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String update(ModelMap model, HttpServletRequest http)
	{
		String id = http.getParameter("id");
		
		Session session = factory.getCurrentSession();
		String hql = "FROM product WHERE id=" + id;
		Query query = session.createQuery(hql);
		List<product> list = query.list();
		for(product p:list){
			data_product data_product = new data_product();
			Product_to_dataProduct(data_product, p);
			model.addAttribute("data_product",data_product);
		}
		return "product/update";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("data_product") data_product data_product, HttpServletRequest http)
	{
		String id = http.getParameter("id_item");
//		System.out.println(data_product.getProduct().getId());
//		System.out.println(id);
		set_data(data_product);
		data_product.getProduct().setID(Integer.parseInt(id));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(data_product.getProduct());
			t.commit();
			model.addAttribute("message", "Cập nhật mới thành công!");
		}catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message", "Cập nhật mới thất bại!");
		}finally {
			session.close();
		}
//		session = factory.getCurrentSession();
//		String hql = "FROM product";
//		Query query = session.createQuery(hql);
//		List<product> list = query.list();
//		model.addAttribute("list", list);
		String str = data_product.getCount_text() + "   " +
						data_product.getCount_link() + "   " +
						data_product.getProduct().getId();
//		System.out.println(data_product.getProduct().getId());
		model.addAttribute("ct_cl_id",str);
		return "jump/jump_update";
	}
	
	@RequestMapping(value="delete")
	public String delete(ModelMap model, product product, HttpServletRequest http)
	{
		String id = http.getParameter("id");
//		System.out.println(id);
		product.setID(Integer.parseInt(id));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
			model.addAttribute("message", "Xóa thành công!");
		}catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message", "Xóa thất bại!");
		}finally {
			session.close();
		}
		
//		session = factory.getCurrentSession();
//		String hql = "FROM product";
//		Query query = session.createQuery(hql);
//		List<product> list = query.list();
//		model.addAttribute("list",list);
		model.addAttribute("id",product.getId());
		return "jump/jump_delete";
	}
}
