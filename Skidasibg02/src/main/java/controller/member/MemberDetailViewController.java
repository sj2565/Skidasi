package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MemberDetailViewController extends SuperClass {
	private final String command = "/detailview.me";
	private final String redirect = "";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao;

	public MemberDetailViewController() {
		super("meDetailView","meDetailView");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="member_id", required=true)String member_id) {
		// 회원 상세 정보를 보려면 해당 사용자의 id가 필수 파라미터로 넘어와야 합니다.
		//id를 이용하여 해당 회원에 대한 정보를 취득합니다. 
		Member bean = this.dao.SelectDataByPk(member_id);
		this.mav.addObject("bean",bean);
		this.mav.setViewName(super.getpage);
		
		return this.mav;
	}
}
