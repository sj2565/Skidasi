package controller.member;

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
import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MemberUpdateController extends SuperClass {
	private final String command = "/update.me";
	private final String redirect = "redirect:/main.co";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao;
	
	public MemberUpdateController() {
		super("meUpdateForm","meUpdateForm");
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("member")
	public Member mymember() {
		return new Member();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="member_id", required = true) String member_id) {
		Member bean = this.dao.SelectDataByPk(member_id);
		this.mav.addObject("bean", bean);
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("member") @Valid Member xxx, BindingResult asdf ) {
		// xxx는 Member 객체가 1개이고, 이것을 command 객체라고 합니다. 
		// xxx는 자바에서만 참조 가능, "member:는 jsp파일에서만 참조가 가능합니다. 
		if(asdf.hasErrors()) {	
			System.out.println("유효성 검사에 문제가 있음");
			System.out.println(xxx.toString());
			System.out.println(asdf.toString());
			this.mav.addObject("bean",xxx);
			this.mav.setViewName(super.getpage);
		}else {
			System.out.println("유효성 검사에 문제가 없음");
			int cnt = -99999;
			cnt = this.dao.UpdateData(xxx);
			this.mav.setViewName(redirect);
		}
		
		return this.mav;
	}
}
