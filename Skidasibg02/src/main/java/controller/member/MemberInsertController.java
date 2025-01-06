package controller.member;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MemberInsertController extends SuperClass {
	private final String command = "/insert.me";
	private final String redirect = "redirect:/login.me";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	public MemberInsertController() {
		super("meInsertForm","boList");
		this.mav = new ModelAndView();
	}
	
	// command 객체란 웹 페이지를 통하여 넘겨지는 하나의 java bean 객체를 일컫는 말입니다. 
	//스프링 관련 form 커스텀 태그를 사용하려면 컨트롤러에서 해당 command 객체에 대한 생성을 반드시 해주어야 합니다.
	//'member'는 jsp파일의 form:form 태그에서 참조되는 항목입니다. 
	@ModelAttribute("member")
	public Member mymember() {
		return new Member();
	}
	
	
	@GetMapping(command)
	public ModelAndView doGet() {
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
			cnt = this.mdao.InsertData(xxx);
			this.mav.setViewName(redirect);
		}
		
		return this.mav;
	}
}
