package controller.resort;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortInfo;
import controller.common.SuperClass;
import dao.ResortInfoDao;

@Controller
public class ResortDeleteController extends SuperClass {
	private final String command = "/delete.rs";
	private final String redirect = "redirect:/list.rs";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("rdao")
	private ResortInfoDao dao;
	
	public ResortDeleteController() {
		super("reList","reList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "resort_no", required = true) String resort_no) {
		ResortInfo resort = this.dao.SelectDataByPk(resort_no);
		int cnt = -99999;
		cnt = this.dao.DeleteData(resort);
		
		this.mav.setViewName(this.redirect);
		return this.mav;
	}
}
