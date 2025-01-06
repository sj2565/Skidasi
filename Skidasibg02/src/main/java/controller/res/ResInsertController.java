package controller.res;

import javax.servlet.http.HttpSession;
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

import bean.Member;
import bean.ResortPrice;
import bean.ResortRes;
import controller.common.SuperClass;
import dao.ResortResDao;

@Controller
public class ResInsertController extends SuperClass {
	private final String command = "/insert.res";
	private final String redirect = "redirect:/search.res";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("resdao")
	public ResortResDao dao;
	
	@ModelAttribute("res")
	public ResortRes myResortRes() {
		return new ResortRes();
	}
	
	public ResInsertController() {
		super("resInsertForm","resList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="pr_no", required = true) String pr_no,
			HttpSession session) {
		Member login = (Member) session.getAttribute("loginfo");
		
		if(login == null) {	//미로그인시 로그인 화면으로
			this.mav.setViewName("redirect:/login.me");
			return this.mav;
		}
		ResortPrice bean = this.dao.SelectPriceDataByPk(pr_no);
		
		
		this.mav.addObject("pr_no", bean.getPr_no());
		if(bean.getPr_aorc().equals("ch")) {
			this.mav.addObject("pr_aorc", "어린이");
		}else {
			this.mav.addObject("pr_aorc", "성인");
		}
		this.mav.addObject("pr_hour", bean.getPr_hour());
		this.mav.addObject("pr_price", bean.getPr_price());
		this.mav.addObject("resort_name", bean.getResort_name());
		this.mav.addObject("resort_no", bean.getResort_no());
		this.mav.addObject("member_id", login.getMember_id());
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("res") @Valid ResortRes res ,
			BindingResult br) {
		if(br.hasErrors()) {
			System.out.println("유효성 문제있음");
		}else {
			System.out.println("유효성 문제 없음");
			int cnt = -99999;
			
			cnt = this.dao.InsertData(res);
		}
		this.mav.setViewName(this.redirect);
		return this.mav;
	}
}
