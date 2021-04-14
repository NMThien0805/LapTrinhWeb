package n17dccn171.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javafx.scene.control.Alert;
import n17dccn171.entity.accout;

@Transactional
@Controller
public class main_login {

	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	
	long code_change = 0;
	
	public void send_code(String email){
		Random generator = new Random();
		long value = generator.nextInt((999999 - 100000) + 1) + 100000;
		
		code_change = value;
		
		String from = "thiennguyen08051999@gmail.com";
		
		try{
			MimeMessage mail = mailer.createMimeMessage();
			
			MimeMessageHelper help = new MimeMessageHelper(mail);
			help.setFrom(from,from);
			help.setTo(email);
			help.setReplyTo(from,from);
			help.setText("Your code: " + String.valueOf(code_change), true);
			
			mailer.send(mail);
		}
		catch(Exception e){
			Alert a = new Alert(null, "Fail!!!");
		}
	}
	
	public String replace_pass(String code, String email, ModelMap model){
		if(Long.parseLong(code) == code_change){
			Session session = factory.getCurrentSession();
			String hql = "FROM accout WHERE email = '" + email + "'";
			Query query = session.createQuery(hql);
			List<accout> list = query.list();
			
			for(accout a : list){
				a.setPassword("AAAaaa0000");
			}
			return "jump/jump_replace_pass";
		}
		else{
			model.addAttribute("mess_change","Code_change fail!!!");
			model.addAttribute("email_send",email);
			return "forgot_password";
		}
	}
	
	@RequestMapping(value="test", method=RequestMethod.GET)
	public String test(ModelMap model, HttpServletRequest http){
		String url_present = http.getParameter("url_present");
		
		accout accout = new accout();
		accout.setCode("a");
		accout.setDiscountcode(0);
		model.addAttribute("accout_email",accout.getEmail());
		if(url_present.equals("details")){
			String id = http.getParameter("id_item");
			model.addAttribute("id", id);
		}
		if(url_present.equals("products")){
			String type_find = http.getParameter("type_find");
			model.addAttribute("type_find", type_find);
		}
		return "jump/jump_main_" + url_present;
	}
	
	@RequestMapping(value="test", method=RequestMethod.POST)
	public String test(ModelMap model, @ModelAttribute("accout")accout acc, HttpServletRequest http){
		
		String url_present = http.getParameter("url_present");
		
		Session session = factory.getCurrentSession();
		String hql = "FROM accout";
		Query query = session.createQuery(hql);
		List<accout> list = query.list();
		model.addAttribute("dsach", list);
		for(accout a:list){
			if(a.getEmail().trim().equals(acc.getEmail()) && a.getPassword().trim().equals(acc.getPassword())){
				model.addAttribute("accout_email", acc.getEmail());
				if(url_present.equals("details")){
					String id = http.getParameter("id_item");
					model.addAttribute("id", id);
				}
				if(url_present.equals("products")){
					String type_find = http.getParameter("type_find");
					model.addAttribute("type_find", type_find);
				}
				if(url_present.equals("register")){
					url_present = "index";
				}
				return "jump/jump_main_" + url_present;
			}
		}
		
		model.addAttribute("accout_email", "");
		return "jump/jump_main_" + url_present;
	}
	
	@RequestMapping("login_imposition")
	public String login_imposition(){
		return "login_imposition";
	}
	
	@RequestMapping(value = "reset_password", method = RequestMethod.POST)
	public String reset_password(@RequestParam("email")String email, HttpServletRequest http, ModelMap model){
		String code = http.getParameter("code_change");
		if(code == null || code.length() == 0){
			send_code(email);
			model.addAttribute("email_send",email);
			return "forgot_password";
		}
		
		String url = replace_pass(code, email, model);
		return url;
	}
	
	@RequestMapping("forgot_password")
	public String forgot_pass(){
		return "forgot_password";
	}
}
