package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping("/test")
	public String testJsp(){
		
		return "test";
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
