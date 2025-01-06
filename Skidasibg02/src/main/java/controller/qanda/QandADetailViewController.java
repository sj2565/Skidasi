package controller.qanda;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Qanda;
import controller.common.SuperClass;
import dao.QandaDao;
import utility.FlowParameters;

@Controller
public class QandADetailViewController extends SuperClass{
	private final String command = "/detailview.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.qa" ;
	
	@Autowired
	@Qualifier("qdao")
	private QandaDao dao ;
	
	public QandADetailViewController() {
		super("QnaDetailView", "QnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="qnacode", required = true)int qnacode,
			@RequestParam(value="pageNumber", required = true)String pageNumber,
			@RequestParam(value="pageSize", required = true)String pageSize,
			@RequestParam(value="mode", required = true)String mode,
			@RequestParam(value="keyword", required = true)String keyword,
			HttpSession session){		
		
		Qanda bean = this.dao.SelectDataByPk(qnacode);	//게시물 정보
		
		FlowParameters parameters = new FlowParameters(pageNumber, pageSize, mode, keyword);
		System.out.println(this.getClass() + " : "+parameters.toString());
		
		if(bean != null) {	//해당 게시물이 존재하면 
			// 작성자의 글이 아니면 조회수 +1
			// 현재 로그인 한 사람과 해당 게시물의 작성자와 비교
			// login는 로그인 한 사람의 정보
			Member login = (Member) session.getAttribute("loginfo");
			// 로그인 하지 않은 경우 로그인창으로 
			if(login == null) {
				this.mav.setViewName("redirect:/login.me");
				return this.mav;
			}
			
			System.out.println("bean.getMember_id():"+bean.getMember_id());
			System.out.println("login.getMember_id():"+login.getMember_id());
			
			if(bean.getMember_id() == null || !bean.getMember_id().equals(login.getMember_id()) ) {
				dao.UpdateReadhit(qnacode);	//조회수 1증가 시키기
			}
			
			this.mav.addObject("bean", bean);
			this.mav.addObject("parameters", parameters.toString());
			
			this.mav.setViewName(super.getpage);
		} else {	//게시물이 존재하지 않으면
			this.mav.setViewName(this.redirect);
		}
		
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(){
		this.mav.setViewName(super.postpage);
		return this.mav ;
	}
}