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
public class MemberIdcheckController extends SuperClass {
	private final String command = "/idcheck.me";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public MemberIdcheckController() {
		super("idCheck",null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="member_id", required = true) String member_id) {
		
		Member bean = this.mdao.SelectDataByPk(member_id);
		
		if(bean != null) {	//존재하는 경우 
			if(bean.getMember_id().equalsIgnoreCase("admin")) {
				this.mav.addObject("message","admin은(는) 사용불가능한 아이디입니다.");
				this.mav.addObject("isCheck",false);
				
			}else {
				this.mav.addObject("message",member_id+"은(는) 사용중인 아이디입니다.");
				this.mav.addObject("isCheck", false);
			}
		}else {	//존재하지 않는 경우
			if (member_id.length() < 4 || member_id.length() > 10) {
				this.mav.addObject("message","아이디는 4자리 이상 10자리 이하로 설정해주세요");
				this.mav.addObject("isCheck", false);
			}else {
				this.mav.addObject("message", member_id+"은(는) 사용 가능한 아이디 입니다.");
				this.mav.addObject("isCheck",true);
			}
		}
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
}
