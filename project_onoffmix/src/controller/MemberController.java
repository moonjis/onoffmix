package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String id, String pass,RedirectAttributes attr,HttpSession session){
		Member mem = memDao.selectOne(id);
		if(mem != null && mem.getPass().equals(pass)){
			//session 생성
			HashMap<String,Object> member = new HashMap<>();
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
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm(){
		return "member/join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(HttpSession session,RedirectAttributes r_attr,@RequestParam HashMap<String, Object> params,@RequestParam MultipartFile photo){			
		
		if(memDao.insertMember(params)>0){
			//성공시에 사진 업로드
		System.out.println(photo);
			if(photo.getSize() >0){
			uploader(photo,session);
			}
			r_attr.addFlashAttribute("msg", "회원 가입에 성공했습니다.");
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/checkId")
	public ResponseEntity<String> checkMember(@RequestParam String id){
		ResponseEntity<String> entity;
		if(memDao.selectOne(id)==null){
			entity = new ResponseEntity<>("ok",HttpStatus.OK);			
		}else {
			entity = new ResponseEntity<>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	private String uploader(MultipartFile uploadfile,HttpSession session){
		System.out.println("uploadfile!");
		if(uploadfile != null){
			String origName = uploadfile.getOriginalFilename();
			String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
			String fileName = getUuid() + ext;			
			String root_path = session.getServletContext().getRealPath("/"); 
			String save_path = root_path + "images/member/";
			try{
				
				File file = new File(save_path + fileName);
				System.out.println("path : "+file.getAbsolutePath());
				System.out.println("list : "+file.list());
				uploadfile.transferTo(file);
				
			}catch(IOException e){
				e.printStackTrace();
			}
			return fileName;
		}
		return null;
	}
	
	public String getUuid(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
