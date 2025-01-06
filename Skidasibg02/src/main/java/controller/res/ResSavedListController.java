package controller.res;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.ResortRes;
import controller.common.SuperClass;
import dao.ResortResDao;

@Controller
public class ResSavedListController extends SuperClass {
	private final String command = "/list.res";
	private final String redirect = "";
	private ModelAndView mav;
	
	@Autowired
	@Qualifier("resdao")
	private ResortResDao dao;
	
	public ResSavedListController() {
		super("resSavedList","resSavedList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpSession session) {
		
		Member mem = (Member) session.getAttribute("loginfo");
		List<ResortRes> lists = null;
		if(mem.getMember_id().equals("admin")) {	//관리자인 경우 모두보기
			lists = this.dao.SelectDataListforAdmin();
		}else {	// 일반 회원은 본인 내역만 보게 하기 
			lists = this.dao.SelectDataList(mem.getMember_id());
		}
		
		this.mav.addObject("lists", lists);
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost() {
		return this.mav;
	}
}
