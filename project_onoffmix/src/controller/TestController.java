package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/test")
	public String testJsp(){
		
		return "test";
	}
	
	
	@RequestMapping("/createRoom")
	public String roomForm() {
		System.out.println("ss");
		return "roomForm";
	}
}
