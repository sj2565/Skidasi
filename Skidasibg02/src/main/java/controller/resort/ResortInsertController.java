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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.ResortInfo;
import controller.common.SuperClass;
import dao.ResortInfoDao;

@Controller
public class ResortInsertController extends SuperClass {
	private final String command = "/insert.rs";
	private final String redirect = "redirect:/list.rs";
	private ModelAndView mav;
	
	@ModelAttribute("resort")
	public ResortInfo myResortInfo() {
		return new ResortInfo();
	}
	
	@Autowired
	@Qualifier("rdao")
	public ResortInfoDao dao;

	public ResortInsertController() {
		super("reInsertForm","reList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			@ModelAttribute("resort") @Valid ResortInfo resort,
			BindingResult br,
			HttpServletRequest request) {
		if(br.hasErrors()) {
			System.out.println("유효성 문제있음");
			System.out.println(resort.toString());
			System.out.println(br.getFieldErrors());
		} else {
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
				this.dao.InsertData(resort);
				
			} catch(IllegalStateException e) {
				e.printStackTrace();
				mav.setViewName(this.redirect);
			} catch (IOException e) {
				e.printStackTrace();
				mav.setViewName(this.redirect);
			}
		}
		return this.mav;
	}
}
