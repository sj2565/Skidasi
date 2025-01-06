package controller.member;

import javax.servlet.http.HttpSession;

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
public class MemberDeleteController extends SuperClass {
	private final String command = "/delete.me";
	private final String redirect = "redirect:/login.me";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	
	public MemberDeleteController() {
		super("meLoginForm", null);
		this.mav = new ModelAndView() ;
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "member_id", required = true) String member_id,
			HttpSession session, String redirect) {
		// 회원이 탈퇴하게 되면, 과거 주문 내역와 작성했던 게시물에 대한 수정이 필요합니다.
		// 그래서, DeleteData 메소드에 member 객체를 넘겨 주어야 합니다.
		Member bean = this.mdao.SelectDataByPk(member_id) ;
		int cnt = -99999 ;
		cnt = this.mdao.DeleteData(bean) ;
		
		// 세션 정보가 있으면 지워 주어야 합니다.
		session.invalidate(); 
		
		this.mav.setViewName(this.redirect);
		return this.mav ;
	}
}

