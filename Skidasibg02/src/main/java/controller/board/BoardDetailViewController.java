package controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Board;
import bean.Member;
import controller.common.SuperClass;
import dao.BoardDao;
import utility.FlowParameters;

@Controller
public class BoardDetailViewController extends SuperClass{
	private final String command = "/detailview.bo" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.bo" ;
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao bdao ;
	
	public BoardDetailViewController() {
		super("boDetailView", "boList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="noticode", required = true)int noticode,
			@RequestParam(value="pageNumber", required = true)String pageNumber,
			@RequestParam(value="pageSize", required = true)String pageSize,
			@RequestParam(value="mode", required = true)String mode,
			@RequestParam(value="keyword", required = true)String keyword,
			HttpSession session){		
		
		Board bean = this.bdao.SelectDataByPk(noticode);	//게시물 정보
		
		FlowParameters parameters = new FlowParameters(pageNumber, pageSize, mode, keyword);
		System.out.println(this.getClass() + " : "+parameters.toString());
		
		if(bean != null) {	//해당 게시물이 존재하면 
			
			
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