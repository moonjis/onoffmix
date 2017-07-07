package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import model.Room;
import service.RoomService;


@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value = "/roomForm")
	public ModelAndView roomForm(HttpSession session) {
		
//		System.out.println("테스트");
		session.setAttribute("id", "sampleId");
		session.setAttribute("name", "myName");
		session.setAttribute("email", "sampleEmail@naver.com");
		session.setAttribute("tel", "01012345678");
			
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("categoryList",roomService.getCategoryList());
//		System.out.println(roomService.getCategoryList());
		mav.setViewName("roomForm");
		return mav;
		
//		return "roomForm";
	}
	
	@RequestMapping(value = "/createRoom")
	public String createRoom(Room room, RedirectAttributes rttr,MultipartFile file) {
		if (roomService.writeBoard(room,file)) {
			
			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:boardList";
	}
	
	
	@RequestMapping(value = "/roomList")
	public ModelAndView roomList() {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("roomList",roomService.getRoomList());
		System.out.println(roomService.getRoomList());
		mav.setViewName("roomList");
		return mav;
	}
	
	@RequestMapping(value = "/roomView")
		public String roomView(int num, Model model) {
		
		Room room = roomService.readRoom(num);
		model.addAttribute("room", room);
		return "roomView";
	}
	
	
	
	
}
