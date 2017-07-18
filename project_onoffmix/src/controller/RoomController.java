package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
//		session.setAttribute("id", "sampleId");
//		session.setAttribute("name", "myName");
//		session.setAttribute("email", "sampleEmail@naver.com");
//		session.setAttribute("tel", "01012345678");
			
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("categoryList",roomService.getCategoryList());
//		System.out.println(roomService.getCategoryList());
		mav.setViewName("roomForm");
		return mav;
		
//		return "roomForm";
	}
	
	@RequestMapping(value = "/createRoom")
	public String createRoom(HttpServletRequest req, Room room, RedirectAttributes rttr,@RequestParam("image") MultipartFile file) {
		System.out.println("createRoom test");
//		System.out.println("file : " + file);
		
	
		if (roomService.createRoom(req, room,file)) {
			
//			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:roomList";
	}
	
	
	   @RequestMapping(value = "/roomList")
	   public ModelAndView roomList(@RequestParam(value="page", defaultValue="1") int page) {
	      
	      ModelAndView mav = new ModelAndView();

	      //mav.addObject("roomList",roomService.getRoomList(page));
	      //System.out.println(roomService.getRoomList());
	      mav.addAllObjects(roomService.getRoomList(page));
	      
	      mav.setViewName("roomList");
	      return mav;
	   }
	
	@RequestMapping(value = "/roomView")
		public String roomView(int num, Model model) {
		
		Room room = roomService.readRoom(num);
		model.addAttribute("room", room);
		return "roomView";
	}

// 모임 수정 폼
	@RequestMapping(value = "modifyRoomForm")
	public String modifyRoomForm(int num, Model model){
		model.addAttribute("categoryList",roomService.getCategoryList());
		model.addAttribute("room",roomService.readRoom(num));
		return "modifyRoomForm";
	}

// 모임 수정 실행
	@RequestMapping(value = "/modify")
	public String modify(Room room, RedirectAttributes rttr) {

		System.out.println("update Board : " + room);
		if (roomService.updateRoom(room)) {
//			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
//			System.out.println("WHY");
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:roomList";
	}
	
// 모임 신청하기	
	@RequestMapping(value = "/joinRoom")
	public String joinRoom(Room room, RedirectAttributes rttr, String id) {

		if (roomService.joinRoom(id, room)) {
			
//			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:roomList";

	}
	
	//전체 모임 삭제
//	@RequestMapping(value = "/deleteRoom")
//	public String deleteRoom(int num, RedirectAttributes rttr) {

//		System.out.println("delete Room : " + room);
//		if (roomService.deleteRoom(num)) {
//			rttr.addFlashAttribute("msg", "SUCCESS");
//		} else {
//			System.out.println("WHY");
//			rttr.addFlashAttribute("msg", "FAIL");
//		}
//		return "redirect:roomList";
//	}
	
	@RequestMapping(value = "/deleteRoom")
	public String deleteRoom(int num, RedirectAttributes rttr) {

//		System.out.println("delete Room : " + room);
		if (roomService.deleteRoom(num)) {
//			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
			System.out.println("WHY");
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:roomList";
	}
	
	//개인 사용자 모임 신청 취소
	@RequestMapping(value = "/outRoom")
	public String outRoom(int num, RedirectAttributes rttr) {

//		System.out.println("delete Room : " + room);
		if (roomService.outRoom(num)) {
//			rttr.addFlashAttribute("msg", "SUCCESS");
		} else {
//			System.out.println("WHY");
			rttr.addFlashAttribute("msg", "FAIL");
		}
		return "redirect:roomList";
	}
	
	
	
	
}
