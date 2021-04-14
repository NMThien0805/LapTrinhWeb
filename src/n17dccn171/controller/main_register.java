package n17dccn171.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import n17dccn171.entity.accout;
import n17dccn171.entity.product;
import n17dccn171.entity.register;

@Transactional
@Controller
public class main_register {

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
	
	public void check_register(ModelMap model, String email, String password){
		Session session = factory.getCurrentSession();
		String hql = "FROM register WHERE email = '" + email +"'";
		Query query = session.createQuery(hql);
		List<register> list_register = query.list();
		if(list_register.isEmpty()){
			accout acc = new accout();
			acc.setEmail(email);
			acc.setPassword(password);
			acc.setCode("a");
			acc.setDiscountcode(0);
			
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(acc);
				t.commit();
			}catch(Exception e)
			{
				t.rollback();
			}finally {
				session.close();
			}	
			model.addAttribute("message", "Registratuon completed");
		}
		else{
			model.addAttribute("message", "Email is already exists");
		}
	}

	public String get_CityCountry(String city, String country, ModelMap model) {
		String s = "";
		
		ArrayList<String> list1 = send_63ProvinceCity(model);
		ArrayList<String> list2 = send_country(model);
		
		s = s + list1.get(Integer.parseInt(city)) + ", " + list2.get(Integer.parseInt(country));
		
		return s;
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap model){
		send_63ProvinceCity(model);
		send_country(model);
		
		model.addAttribute("register", new register());
		return "register";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("register")register register,
							@RequestParam("nohouse")String nohouse, @RequestParam("street")String street,
							@RequestParam("ward")String ward, @RequestParam("district")String district,
							@RequestParam("city")String city, @RequestParam("country")String country){
		
		String address = nohouse + ", " + street + " Street, Ward " + ward + ", District " + district + ", " + get_CityCountry(city, country, model);
		
		register.setAddress(address);
		
		//System.out.println(address);
		check_register(model, register.getEmail(), register.getPassword());
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(register);
			t.commit();
		}catch(Exception e)
		{
			t.rollback();
		}finally {
			session.close();
		}
		
		return "register";
	}
	
}
