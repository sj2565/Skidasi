package controller.res;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.ResortResDao;

@Controller
public class ResCancelController extends SuperClass {
	private final String command = "/cancel.res";
	private final String redirect = "redirect:/list.res";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("resdao")
	public ResortResDao dao;

	public ResCancelController() {
		super("resList","resList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="res_no", required = true) String res_no) {
		
		int cnt = -99999;
		cnt = this.dao.CancelResByPk(res_no);
		this.mav.setViewName(this.redirect);
		return this.mav;
	}
	
}
