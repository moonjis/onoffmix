package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping("/main")
	public String testJsp(){
		
		return "main";
	}

//	@RequestMapping("/createRoom")
//	public String roomForm() {
//		
//		return "roomForm";
//	}
	
//	@RequestMapping("/roomList")
//	public String roomList() {
//		
//		return "roomList";
//	}
}
