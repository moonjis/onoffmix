package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import dao.IReplyDao;
import model.Reply;
import service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	IReplyDao replyDao;
	
	@Autowired
	private ReplyService replyservice;
	
	@RequestMapping(value="" ,method=RequestMethod.POST)
	public ResponseEntity<String> register(Reply reply){
		//개발자가 직접 Http요청 상태코드 + data를 직접 제어할 수 있는 클래스
		//http요청 상태 코드를 직접 제어할 수 있는 클래스 -> ReponseEntity(데이터와 요청 상태를 같이 전송 ) 
	
		//System.out.println("Reply:"+reply);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			replyservice.addReply(reply);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		return entity; 
		
	}
	@RequestMapping(value="/all/{num}",method=RequestMethod.GET)
	public ResponseEntity<List<Reply>> list(@PathVariable("num")int num){
		
		//System.out.println("리스트진입~");
		ResponseEntity<List<Reply>> entity = null;
		try {
			
			entity = new ResponseEntity<List<Reply>>(replyservice.getReplyList(num),HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

	@RequestMapping(value="/{rno}", method=RequestMethod.POST)
	public ResponseEntity<String>update(@PathVariable("rno") int rno
										,@RequestParam("replytext")String replytext
										
										,HttpSession session){
		
		System.out.println("수정 컨트롤러 진입");
		ResponseEntity<String>entity = null;
		Reply reply = new Reply();
		reply.setRno(rno);
		reply.setReplytext(replytext);
		
		//Reply reple =replyDao.selectOne(rno);
		
		try {
		
				replyservice.modifyReply(reply);
				//여기는 성공
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			//여기는 실패
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
 
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
	public ResponseEntity<String>delete(@PathVariable("rno")int rno){
		System.out.println("삭제진입");
		ResponseEntity<String>entity = null;

		try {
			replyservice.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	

}