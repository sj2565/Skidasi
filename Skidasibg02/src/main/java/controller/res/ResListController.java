package controller.res;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortPrice;
import controller.common.SuperClass;
import dao.ResortResDao;

@Controller
public class ResListController extends SuperClass {
	private final String command = "/search.res";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("resdao")
	public ResortResDao dao;
	
	public ResListController() {
		super("resList","resList");
		this.mav =  new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		List<ResortPrice> lists =  this.dao.SelectPriceData();
		
		this.mav.addObject("lists", lists);
		this.mav.setViewName(this.getpage);
		return this.mav;
	}
}
