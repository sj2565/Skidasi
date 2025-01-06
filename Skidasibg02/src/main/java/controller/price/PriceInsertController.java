package controller.price;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortInfo;
import bean.ResortPrice;
import controller.common.SuperClass;
import dao.ResortPriceDao;

@Controller
public class PriceInsertController extends SuperClass {
	private final String command = "/insert.pr";
	private final String redirect = "redirect:/list.rs";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("pdao")
	private ResortPriceDao dao;
	
	public PriceInsertController() {
		super("prInsertForm","prInsertForm");
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("price")
	public ResortPrice myResortPrice() {
		return new ResortPrice();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="resort_no", required = true) String resort_no) {
		ResortInfo resort = this.dao.SelectResortInfoByPk(resort_no);
		this.mav.addObject("resort_no", resort.getResort_no());
		this.mav.addObject("resort_name", resort.getResort_name());
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("price") @Valid ResortPrice resortPrice ,
			BindingResult br ) {
		if(br.hasErrors()) {
			System.out.println("유효성 문제 있음");
			System.out.println(resortPrice.toString());
		}else {
			int cnt = -99999;
			cnt = dao.InsertData(resortPrice);
			this.mav.setViewName(this.redirect);
		}
		
		return this.mav;
	}
}
