package controller.price;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.ResortPriceDao;

@Controller
public class PriceListController extends SuperClass {
	private final String command = "/list.pr";
	private final String redirect = "redirect:/list.pr";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("pdao")
	private ResortPriceDao dao;
	
	public PriceListController() {
		super("prList","prList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			) {
		List lists = new ArrayList();
		lists = this.dao.SelectData();
		this.mav.addObject("lists", lists);
		this.mav.setViewName(this.getpage);
		return this.mav;
	}

}
