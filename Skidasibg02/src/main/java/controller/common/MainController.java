package controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	//스캐닝의 대상
public class MainController {
	@RequestMapping("/main.co")	//main.co라는 요청이 들어오면 응답합니다. 
	public String doGet() {
		return "main";	//main으로 반환됩니다. 
	}
}
