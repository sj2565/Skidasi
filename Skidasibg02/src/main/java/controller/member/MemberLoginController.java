package controller.member;

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
import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MemberLoginController extends SuperClass{
	private final String command = "/login.me";	//요청 커맨드
	private final String redirect = "redirect:/main.co";	//리다이렉팅할 페이지
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	
	public MemberLoginController() {
		super("meLoginForm", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value = "member_id", required = true) String member_id,
			@RequestParam(value = "password", required = true) String password,
			HttpSession session){		
		
		boolean isCheck = true ; // false이면 유효성 검사에 문제가 있습니다.
		
		if (member_id.length() < 4 || member_id.length() > 10) {
			this.mav.addObject(super.PREFIX + "id", "아이디는 4자리 이상 10자리 이하이어야 합니다.") ;
			isCheck = false ;
		}
		if (password.length() < 4 || password.length() > 10) {
			this.mav.addObject(super.PREFIX + "password", "비밀 번호는 4자리 이상 10자리 이하이어야 합니다.") ;
			isCheck = false ;
		}
		
		if (isCheck == true) {
			Member bean = this.mdao.SelectData(member_id, password);
			
			if (bean == null) { // failure
				String message = "아이디나 비번이 잘못 되었습니다." ;
				this.mav.addObject("errmsg", message) ;
				this.mav.setViewName(super.getpage); 
			} else { // success
				// 세션 영역에 로그인 정보를 바인딩합니다.
				session.setAttribute("loginfo", bean); 
				
				
				
				this.mav.setViewName(redirect);
			}
			
		} else { // 문제가 있슴
			this.mav.addObject("member_id", member_id) ;
			this.mav.addObject("password", password) ;
			this.mav.setViewName(super.getpage);
		}
		
		return this.mav ;
	}
	
}
