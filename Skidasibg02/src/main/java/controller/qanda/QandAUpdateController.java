package controller.qanda;

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

import bean.Qanda;
import controller.common.SuperClass;
import dao.QandaDao;

@Controller
public class QandAUpdateController extends SuperClass{
	private final String command = "/update.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.qa" ;
	
	@Autowired
	@Qualifier("qdao")
	private QandaDao dao ;
	
	// for form:form custom tag
	@ModelAttribute("qanda")
	public Qanda myqanda() {
		return new Qanda();
	}
	
	public QandAUpdateController() {
		super("QnaUpdateForm", "QnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="qnacode", required = true ) int qnacode){		
		// xxx는 이전에 등록했던 게시물 1건의 정보입니다. 
		Qanda xxx = this.dao.SelectDataByPk(qnacode);
		this.mav.addObject("bean", xxx);
		
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("board") @Valid Qanda xxx, BindingResult asdf){
		if(asdf.hasErrors()) {
			System.out.println("유효성 검사에 문제 있음");
			System.out.println(xxx);
			System.out.println(asdf);
			this.mav.addObject("bean",	xxx);
			
			this.mav.setViewName(super.postpage);
		} else {
			System.out.println("유효성 검사에 문제 없음");
			System.out.println(xxx.toString());
			int cnt = -99999;
			cnt = dao.UpdateData(xxx);
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
		}
		return this.mav ;
	}
}