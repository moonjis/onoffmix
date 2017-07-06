package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ImemberDao;
import model.Member;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	ImemberDao memDao;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(){
		
		return "member/login";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm(){
		return "member/join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@RequestParam HashMap<String, Object> params){			
		
		memDao.insertMember(params);
		
		return "redirect:/main";
	}
}
