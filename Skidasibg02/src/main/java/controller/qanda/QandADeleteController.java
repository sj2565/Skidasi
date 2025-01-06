package controller.qanda;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Qanda;
import controller.common.SuperClass;
import dao.QandaDao;
import utility.FlowParameters;
import utility.Paging;

@Controller
public class QandADeleteController extends SuperClass{
	private final String command = "/delete.qa" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.qa" ;
	
	@Autowired
	@Qualifier("qdao")
	private QandaDao dao ;
	
	public QandADeleteController() {
		super("QnaList", "QnaList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpServletRequest request,
			@RequestParam(value="no", required = true) int no,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, 
			@RequestParam(value = "pageSize", required = false) String pageSize,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "keyword", required = false) String keyword){
		int cnt = -99999;
		cnt = this.dao.DeleteData(no);
		
		// 페이징과 필드 검색을 위한 파라미터를 우선 챙깁니다.
		FlowParameters parameters = new FlowParameters(pageNumber, pageSize, mode, keyword);
						
		// 파라미터 확인을 위한 출력
		System.out.println(this.getClass() + " : " + parameters.toString());
						
		int totalCount = dao.SelectTotalCount(
				parameters.getMode(), 
				parameters.getKeyword());
					
		System.out.println("totalCount : " + totalCount );
						
		String contextpath = request.getContextPath() + "/" ;
		String myurl = contextpath +  this.command ;
					
		Paging pageInfo = new Paging(
				parameters.getPageNumber(), 
				parameters.getPageSize(), 
				totalCount, 
				myurl, 
				parameters.getMode(), 
				parameters.getKeyword());
				
		List<Qanda> lists = dao.SelectDataList(
				pageInfo.getOffset(),
				pageInfo.getLimit(),
				parameters.getMode(), 
				parameters.getKeyword()) ;

		this.mav.addObject("lists", lists);
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
	
}