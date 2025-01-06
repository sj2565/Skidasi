package controller.resort;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortInfo;
import controller.common.SuperClass;
import dao.ResortInfoDao;
import utility.FlowParameters;

@Controller
public class ResortDetailViewController extends SuperClass {
	private final String command = "/detailview.rs";
	private final String redirect = "";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("rdao")
	private ResortInfoDao dao;

	public ResortDetailViewController() {
		super("reDetailView","reList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
		@RequestParam(value="resort_no", required = true)String no){		
		
		ResortInfo bean = this.dao.SelectDataByPk(no);	//게시물 정보
		
		if(bean != null) {	//해당 게시물이 존재하면 
			
			this.mav.addObject("bean", bean);
			
			this.mav.setViewName(super.getpage);
		} else {	//게시물이 존재하지 않으면
			this.mav.setViewName(this.redirect);
		}
		
		return this.mav ;
	}


}
