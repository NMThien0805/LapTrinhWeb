package n17dccn171.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.descriptor.java.BigIntegerTypeDescriptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javassist.expr.NewArray;
import n17dccn171.entity.accout;
import n17dccn171.entity.cart;
import n17dccn171.entity.detail;
import n17dccn171.entity.product;
import n17dccn171.entity.about_us;
import n17dccn171.entity.register;
import n17dccn171.entity.code_event;

@Transactional
@Controller
public class main_test {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("chay_thu")
	public String a(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM product";
		Query query = session.createQuery(hql);
		List<product> s = query.list();
		model.addAttribute("s",s);
		return "NewFile";
	}
	
	@RequestMapping("show_detail")
	public String de(ModelMap model, @ModelAttribute("sent")String search){
		String bua = "fornix_F5";
		String[] arr = bua.split("_");
		
		/*System.out.print("mang 1: " + arr[0]);*/
		
		Session session = factory.getCurrentSession();
		String hql = "FROM detail WHERE brands='" + arr[0] 
					+ "' AND  itemname='" + arr[1] + "'";
		Query query = session.createQuery(hql);
		List<detail> list = query.list();
		
		/*List<String> list_text = Arrays.asList(list.get(0).getItemtext().split("|"));
		List<String> list_link = Arrays.asList(list.get(0).getItemlink().split("|"));*/
		
		String[] list_text = list.get(0).getItemtext().trim().split("   ");
		String[] list_link = list.get(0).getItemlink().trim().split("   ");
		
		//System.out.print("mang 1: " + list_text[0]);
		
		model.addAttribute("text",list_text);
		model.addAttribute("link",list_link);
		return "NewFile";
	}
	
	@RequestMapping("table_code_event")
	public String code_event(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM code_event";
		Query query = session.createQuery(hql);
		List<code_event> list = query.list();
		model.addAttribute("dsach", list);
		
		return "NewFile";
	}
}
