package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.IroomDao;
import model.Room;

@Controller
public class TestController {

	@Autowired
	IroomDao roomDao;
	
	@RequestMapping("/main")
	public String testJsp(Model model){
		List<Room> list = roomDao.getMainRooms();
		
		model.addAttribute("list", list);
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
