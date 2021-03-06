package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ImemberDao;
import model.Member;
import model.Room;
import service.RoomService;

@RequestMapping("/member")
@Controller
public class MemberController {
	private final static String MEMBER_DS = "member/";
	@Autowired
	ImemberDao memDao;
	
	@Autowired
	RoomService roomService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {

		return MEMBER_DS + "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String pass, RedirectAttributes attr, HttpSession session) {
		Member mem = memDao.selectOne(id);
		if (mem != null && mem.getPass().equals(pass)) {
			// session 생성
			HashMap<String, Object> member = new HashMap<>();
			member.put("id", mem.getId());
			member.put("name", mem.getName());
			member.put("email", mem.getEmail());
			member.put("phone", mem.getPhone());
			session.setAttribute("member", member);

			return "redirect:/main";
		} else {
			attr.addFlashAttribute("msg", "id 또는 비밀번호가 잘못되었습니다.");
			return "redirect:login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(RedirectAttributes r_attr, HttpSession session) {
		session.invalidate();
		r_attr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		return "redirect:/main";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return MEMBER_DS + "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpSession session, RedirectAttributes r_attr, @RequestParam HashMap<String, Object> params,
			@RequestParam MultipartFile photo) {

		// 성공시에 사진 업로드
		System.out.println(photo);
		if (photo.getSize() > 0) {
			params.put("photo", uploader(photo, session));
		}
		memDao.insertMember(params);
		r_attr.addFlashAttribute("msg", "회원 가입에 성공했습니다.");

		return "redirect:/main";
	}

	@RequestMapping(value = "/checkId")
	public ResponseEntity<String> checkMember(@RequestParam String id) {
		ResponseEntity<String> entity;
		if (memDao.selectOne(id) == null) {
			entity = new ResponseEntity<>("ok", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/mypage")
	public String myPage(HttpSession session, Model model, RedirectAttributes r_attr) {
		HashMap<String, Object> hm_member = (HashMap<String, Object>) session.getAttribute("member");
		if (hm_member != null) {
			String id = (String) hm_member.get("id");
			Member member = memDao.selectOne(id);			
			/*if(member.getPhoto()!=null){//사진 경로 넣기
				String root_path = session.getServletContext().getRealPath("/");
				String save_path = root_path + "images/member/";
				member.setPhoto(save_path + member.getPhoto());
			}*/
			model.addAttribute("attr_member", member);
		} else {
			r_attr.addFlashAttribute("msg", "로그인 해주세요.");
			return "redirect:login";
		}

		return MEMBER_DS + "myPage";
	}
	
	@RequestMapping(value="/myroomlist")
	@ResponseBody
	public ResponseEntity<HashMap<String,Object>> getMyRoomList(HttpSession session,
			@RequestParam(required = false,defaultValue = "1") int page,
			@RequestParam(required = false,defaultValue = "create") String type){
		ResponseEntity<HashMap<String,Object>> entity = null;		
		HashMap<String,Object> member = (HashMap<String,Object>)session.getAttribute("member");
		HashMap<String,Object> result = new HashMap<>();
		if(member != null){
			String id = (String)member.get("id");
			HashMap<String,Object> map = new HashMap<>();			
			map.put("id", id);
			map.put("page",page);			
			
			if(type.equals("create")){	//개설한 모임 리스트 출력
				result = roomService.selectMyRooms(map); 
			}else if(type.equals("join")){	//참여한 모임 리스트 출력
				result = roomService.selectJoinRooms(map); 
			}			
			entity = new ResponseEntity<HashMap<String,Object>>(result,HttpStatus.OK);
		} else {
			entity = new ResponseEntity<HashMap<String,Object>>(result,HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	@RequestMapping(value="/edit")
	@ResponseBody
	public ResponseEntity<String> edit(HttpSession session,
			@RequestParam HashMap<String,Object> member,
			@RequestParam MultipartFile photo) {
				
		System.out.println(member);
		ResponseEntity<String> result = null;		
		HashMap<String,Object> h_member = (HashMap<String,Object>)session.getAttribute("member");
		if(h_member!= null){
			String id = (String)h_member.get("id");
			member.put("id", id);
			System.out.println(member);
			//사진이 있으면 업로드 후 member에 추가 
			if (photo.getSize() > 0) {
				member.put("photo", uploader(photo, session));
				System.out.println("p: " + member.get("photo"));
			}else {
				member.put("photo", null);
			}
			if(id != null && memDao.updateOne(member) > 0){
				//업데이트 성공
				result = new ResponseEntity<String>("ok",HttpStatus.OK);
			}		
		}else {
			result = new ResponseEntity<String>("nope",HttpStatus.BAD_REQUEST);			
		}		
		return result;
	}
	
	private String uploader(MultipartFile uploadfile, HttpSession session) {
		System.out.println("uploadfile!");
		if (uploadfile != null) {
			String origName = uploadfile.getOriginalFilename();
			String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
			String fileName = getUuid() + ext;
			String root_path = session.getServletContext().getRealPath("/");
			String save_path = root_path + "images/member/";
			try {
				File file = new File(save_path + fileName);
				System.out.println("path : " + file.getAbsolutePath());				
				uploadfile.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return fileName;
		}
		return null;
	}
	
	

	public String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
