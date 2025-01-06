package controller.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MemberLogoutController extends SuperClass{
	private final String command = "/logout.me";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public MemberLogoutController() {
		super("meLoginForm", "boList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(HttpSession session) {
		// 세션 공간에 장바구니 정보가 있으면 처리해야 합니다. 
		
		session.invalidate();	//세션 내용 지우기
		this.mav.setViewName(super.getpage);	//로그인 페이지로 다시 이동합니다.
		return this.mav;
	}
	
}
