package n17dccn171.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_ADDPeer;

import javafx.scene.control.Alert;
import n17dccn171.entity.cart;
import n17dccn171.entity.contact_us;
import n17dccn171.entity.product;

@Controller
public class main_contact_us {
	@Autowired
	JavaMailSender mailer;
	@Autowired
	SessionFactory factory ;
	
	public void save_contact(String mess, String email){
		contact_us ct_us = new contact_us();
		
		ct_us.setEmail(email);
		ct_us.setMessage(mess);
		
		System.out.println(ct_us);
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(ct_us);
			t.commit();
			System.out.println("Thêm mới thành công!");
		}catch(Exception e)
		{
			t.rollback();
			System.out.println("Thêm mới thất bại!");
		}finally {
			session.close();
		}
	}
	
	public String set_repMess(String message, String name){
		String s = 	"-----Thank " + name + " -----"
				+ "PhoneNumber: 0964796144"
				+ "Email: thiennguyen08051999@gmail.com"
				+ "Your message: ";
		return s + message;
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
	
	@RequestMapping("send_mail")
	public String send(ModelMap model, @RequestParam("Name")String name,
						@RequestParam("email")String email,
						@RequestParam("message")String message){
		String from = "thiennguyen08051999@gmail.com";
		
		String send = set_repMess(message, name);
		
		save_contact(message, email);
		
		//System.out.println(send);
		
		try{
			MimeMessage mail = mailer.createMimeMessage();
			
			MimeMessageHelper help = new MimeMessageHelper(mail);
			help.setFrom(from,from);
			help.setTo(email);
			help.setReplyTo(from,from);
			help.setText(send, true);
			
			mailer.send(mail);
		}
		catch(Exception e){
			Alert a = new Alert(null, "Fail!!!");
		}
		
		return "jump/jump_contact_us";
	}
	
	@RequestMapping("contact_us")
	public String contact_us(ModelMap model, HttpServletRequest http){
		String accout_email = http.getParameter("accout_email");
		
		String to_cart = http.getParameter("to_cart");
		
		add_to_cart(to_cart, accout_email);
		
		model.addAttribute("accout_email", accout_email);
		return "contact_us";
	}
}
