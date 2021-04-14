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
@RequestMapping("/detail/")
public class detailcontroller {
	int n_text = 0;
	int n_link = 0;
	
	public void set_data(data_detail data_detail){
		String str="";
		String temp="themes/images/" + data_detail.getDetail().getBrands() + "/" +
				data_detail.getDetail().getItemname() + "/" +
				data_detail.getDetail().getBrands() + "_" +
				data_detail.getDetail().getItemname();
		str = str.concat(temp).concat(".jpg");
		for(int i = 1; i<=n_link;i++){
			str = str.concat("   ").concat(temp).concat(i + ".jpg");
		}
//		System.out.print("bua" + str);
		data_detail.getDetail().setItemlink(str);
		
		str = "";
		for(int i = 0; i<n_text;i++){
			str = str.concat(data_detail.getDetail_bonus().getText()[i]).concat("   ");
		}
		str = str.trim();
//		System.out.print("bua" + str);
		data_detail.getDetail().setItemtext(str);
	}
	
	public int count_element_text(String text, String where){
		return text.trim().split(where).length;
	}
	
	public void Detail_to_dataDetail(data_detail data_detail, detail detail){
		data_detail.setDetail(detail);
		
		if(count_element_text(detail.getItemtext().trim(), "   ") == data_detail.getCount_text()){
			String[] arr = detail.getItemtext().trim().split("   ");
			data_detail.getDetail_bonus().setText(arr);
		}
	}
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index_detail")
	public String index_detail(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM detail";
		Query query = session.createQuery(hql);
		List<detail> list = query.list();
		model.addAttribute("list", list);
		return "detail/index_detail";
	}
	@RequestMapping(value="insert", method = RequestMethod.GET)
	public String insert(ModelMap model,  HttpServletRequest http)
	{
		String b_n_ct_cl = http.getParameter("b_n_ct_cl");
		
		String[] cut = b_n_ct_cl.split("   ");
		
		data_detail data_detail = new data_detail();
		
		data_detail.getDetail().setBrands(cut[0]);
		data_detail.getDetail().setItemname(cut[1]);
		
		data_detail.setCount_text(Integer.parseInt(cut[2]));
		data_detail.setCount_link(Integer.parseInt(cut[3]));
		
		//data_detail.getDetail_bonus().setText(new String[Integer.parseInt(cut[2])]);
		n_text = data_detail.getCount_text();
		n_link = data_detail.getCount_link();
		
		model.addAttribute("data_detail", data_detail);
		return "detail/insert";
	}
	
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("data_detail") data_detail data_detail)
	{
		set_data(data_detail);
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(data_detail.getDetail());
			t.commit();
			model.addAttribute("message", "Thêm mới thành công!");
		}catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại!");
		}finally {
			session.close();
		}
		return "product/insert";
	}
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String update(ModelMap model, HttpServletRequest http)
	{
		String ct_cl_id = http.getParameter("ct_cl_id");
		
		String[] cut = ct_cl_id.split("   ");
		
		data_detail data_detail = new data_detail();
		
		data_detail.setCount_text(Integer.parseInt(cut[0]));
		data_detail.setCount_link(Integer.parseInt(cut[1]));
		
		//data_detail.getDetail_bonus().setText(new String[Integer.parseInt(cut[2])]);
		n_text = data_detail.getCount_text();
		n_link = data_detail.getCount_link();
		
		Session session = factory.getCurrentSession();
		String hql = "FROM detail WHERE id=" + cut[2];
		Query query = session.createQuery(hql);
		List<detail> list = query.list();
		for(detail p:list){
			Detail_to_dataDetail(data_detail, p);
		}
		model.addAttribute("data_detail", data_detail);
		return "detail/update";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("data_detail") data_detail data_detail)
	{
//		System.out.println(data_detail.getDetail_bonus().getText()[0]);
		set_data(data_detail);
//		System.out.println(data_detail.getDetail().getItemtext());
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(data_detail.getDetail());
			t.commit();
			model.addAttribute("message", "Cập nhật mới thành công!");
		}catch(Exception e)
		{
			System.out.println(e.toString());
			t.rollback();
			model.addAttribute("message", "Cập nhật mới thất bại!");
		}finally {
			session.close();
		}
//		session = factory.getCurrentSession();
//		String hql = "FROM product";
//		Query query = session.createQuery(hql);
//		List<detail> list = query.list();
//		model.addAttribute("list", list);
		return "jump/jump_index_product";
	}
	
	@RequestMapping(value="delete")
	public String delete(ModelMap model, detail detail)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(detail);
			t.commit();
			model.addAttribute("message", "Xóa thành công!");
		}catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message", "Xóa thất bại!");
		}finally {
			session.close();
		}
//		
//		session = factory.getCurrentSession();
//		String hql = "FROM detail";
//		Query query = session.createQuery(hql);
//		List<detail> list = query.list();
//		model.addAttribute("list",list);
		
		return "jump/jump_index_product";
	}
}
