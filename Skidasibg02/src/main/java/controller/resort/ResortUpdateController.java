package controller.resort;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortInfo;
import controller.common.SuperClass;
import dao.ResortInfoDao;

@Controller
public class ResortUpdateController extends SuperClass {
	private final String command = "/update.rs";
	private final String redirect = "redirect:/list.rs";
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("rdao")
	private ResortInfoDao dao;
	
	@ModelAttribute("resort")
	public ResortInfo myResort() {
		return new ResortInfo();
	}

	public ResortUpdateController() {
		super("reUpdateForm","reUpdateForm");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value="resort_no", required = true) String resort_no) {
		ResortInfo resort = this.dao.SelectDataByPk(resort_no);
		this.mav.addObject("bean", resort);
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("resort") @Valid ResortInfo resort, 
			BindingResult asdf,
			HttpServletRequest request) {
		if(asdf.hasErrors()) {
			System.out.println("유효성 문제 있음");
			this.mav.addObject("bean",resort);
			this.mav.setViewName(super.getpage);
		}else {
			System.out.println("유효성 문제 없음");
			System.out.println(resort.toString());
			MultipartFile multi = resort.getImgfile();
			System.out.println(multi);
			
			String uploadPath = "/uploadimg";
			String realPath = request.getRealPath(uploadPath);
			System.out.println(realPath);
			try {
				File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
				
				multi.transferTo(destination);
				mav.setViewName(this.redirect);
				
				resort.setResort_img(destination.getName());
				this.dao.UpdateData(resort);
				
			} catch(IllegalStateException e) {
				e.printStackTrace();
				mav.setViewName(this.redirect);
			} catch (IOException e) {
				e.printStackTrace();
				mav.setViewName(this.redirect);
			}
			
			this.mav.setViewName(this.redirect);
		}
		
		return this.mav;
	}
}
