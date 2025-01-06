package controller.resort;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.ResortInfoDao;

@Controller
public class ResortListController extends SuperClass {
	private final String command = "/list.rs";
	private final String redirect = "redirect:/list.rs";
	private ModelAndView mav;
	
	public ResortListController() {
		super("reList","reList");
		this.mav = new ModelAndView();
	}
	
	@Autowired
	@Qualifier("rdao")
	private ResortInfoDao dao;
	
	@GetMapping(command)
	public ModelAndView doGet() {
		List lists = new ArrayList();
		lists = dao.SelectData();
		this.mav.addObject("lists", lists);
		this.mav.setViewName(this.getpage);
		return this.mav;
	}
}
