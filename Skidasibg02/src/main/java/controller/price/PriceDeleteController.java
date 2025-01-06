package controller.price;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.ResortPriceDao;

@Controller
public class PriceDeleteController extends SuperClass {
	private final String command = "/delete.pr";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("pdao")
	private ResortPriceDao dao;
	
	public PriceDeleteController() {
		super("prList","prList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "pr_no", required = true) String pr_no ) {
		int cnt = -99999;
		cnt = this.dao.DeleteData(pr_no);
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
}
