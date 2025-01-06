package controller.qanda;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Qanda;
import controller.common.SuperClass;
import dao.QandaDao;

@Controller
public class QandAReplyController extends SuperClass {
	private final String command = "/reply.qa";
	private final String redirect = "redirect:/list.qa";
	private ModelAndView mav = null;
	
	@ModelAttribute("qanda")
	public Qanda myqanda() {
		System.out.println("@ModelAttribute(\"qanda\")");
		return new Qanda();
	}
	
	@Autowired
	@Qualifier("qdao")
	private QandaDao dao;
	
	public QandAReplyController() {
		super("QnaReplyForm","QnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("qanda") @Valid Qanda xxx,
			BindingResult asdf) {
		if ( asdf.hasErrors() ) {
			System.out.println("유효성 검사에 문제 있슴");
			System.out.println( asdf );
			this.mav.addObject("bean", xxx);	
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사에 문제 없슴");
			int cnt = -99999 ; 			
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = dao.ReplyData(xxx) ;			
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
		}
		return this.mav;
	}
}
