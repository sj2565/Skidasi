package controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;
import utility.Paging;

@Controller
public class MemberListController extends SuperClass {
	private final String command = "/list.me" ;
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao  ; 
	
	public MemberListController() {
		super("meList", null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize,
			HttpServletRequest request) {
		
		int totalCount = this.mdao.SelectTotalCount() ;
		System.out.println(this.getClass() + " totalCount : " + totalCount); 
		
		String myrul = request.getContextPath() + "/list.me" ;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, myrul, null, null)  ;
		
		List<Member> lists = mdao.SelectDataList(pageInfo.getOffset(), pageInfo.getLimit()) ;
		System.out.println("members size : " + lists.size());		
		
		this.mav.addObject("lists", lists);
		
		this.mav.addObject("pagingHtml", pageInfo.getPagingHtml()); 
		this.mav.addObject("pagingStatus", pageInfo.getPagingStatus());
		
		this.mav.setViewName(super.getpage);
		
		return this.mav ;
	}
}
