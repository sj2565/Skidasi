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
public class PriceUpdateController extends SuperClass {
	private final String command = "/update.pr";
	private final String redirect = "redirect:/list.pr";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("pdao")
	private ResortPriceDao dao;
	
	@ModelAttribute("price")
	public ResortPrice myResortPrice() {
		return new ResortPrice();
	}
	
	public PriceUpdateController() {
		super("prUpdateForm","prList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="pr_no", required = true) String pr_no) {
		ResortPrice price = this.dao.SelectResortPriceByPk(pr_no);
		this.mav.addObject("bean",price);
		this.mav.setViewName(this.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("price") @Valid ResortPrice resortPrice ,
			BindingResult br) {
		if(br.hasErrors()) {
			System.out.println("유효성 문제 있음");
			System.out.println(resortPrice.toString());
		}else {
			System.out.println(resortPrice.toString());
			int cnt = -99999;
			cnt = this.dao.UpdateData(resortPrice);
		}
		
		this.mav.setViewName(this.redirect);
		return this.mav;
	}
}
