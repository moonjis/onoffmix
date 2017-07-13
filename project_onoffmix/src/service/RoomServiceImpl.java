package service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.IroomDao;
import model.Category;
import model.Room;



@Service
public class RoomServiceImpl implements RoomService {
	
	
	//private static final String UPLOAD_PATH = "C://hanbit//upload";
	
	private static String UPLOAD_PATH;
	

	
	@Autowired
	private IroomDao iroomDao;
	
	@Override
	public List<Room> getRoomList() {
		
		return iroomDao.selectAll();
	}

	@Override
	public List<Category> getCategoryList() {
	
		return iroomDao.selectCategory();
	}

	@Override
	public Room readRoom(int num) {
		
		Room room = iroomDao.selectOne(num);
		
//		System.out.println(room);
		
//		board.setReadCount(board.getReadCount() + 1);
//		boardDao.updateBoard(board);
		return room;
	}

	@Override
	public boolean createRoom(HttpServletRequest req, Room room, MultipartFile file) {
		
		HashMap<String, Object> params = new HashMap<String,Object>();
		System.out.println("createroom : " + room);
		
		UPLOAD_PATH = req.getServletContext().getRealPath("images/room");
		
		try {
			
			
			String fullname = uploadFile(file.getOriginalFilename(),file.getBytes());
		
			System.out.println("insert 후 : " + room);
			iroomDao.insertRoom(room);
			int room_num = room.getRoom_num();
			
			params.put("fullname", fullname);
			params.put("num", room_num);
			
			iroomDao.insertAttach(params);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	
	}	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		

		/*
		 * file을 전달 받아서 서버의 특정 위치에 저장, 저장 시, 같은 이름의 파일이 업로드 되었을 시 문제가 발생할 수 있기
		 * 때문에 UUID를 이용해서 파일이름이 겹치지 않게 업로드 하기. 생성 파일 이름을 반환
		 */

		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;

		//System.out.println(savedName);

		File target = new File(UPLOAD_PATH, savedName);

		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@Override
	public boolean updateRoom(Room room) {
		try {
			System.out.println(room);
			iroomDao.updateRoom(room);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean joinRoom(String id, Room room) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("room_num", room.getRoom_num());
//		System.out.println("room_num : "+ room.getRoom_num());
		
		try {		
			iroomDao.joinRoom(params);		
			room = iroomDao.selectOne(room.getRoom_num());
		
			room.setCount(room.getCount() + 1);
			iroomDao.updateCount(room);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteRoom(int num) {
		try {
//			System.out.println(room);
			iroomDao.outRoom(num);
			iroomDao.deleteAttach(num);
			iroomDao.deleteRoom(num);		
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean outRoom(int num) {
		try {

//			System.out.println(room);
			iroomDao.outRoom(num);
			Room room;
			room = iroomDao.selectOne(num);
			System.out.println("delete : " + room);
			room.setCount(room.getCount() - 1);
			iroomDao.updateCount(room);
		
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	}

	


	


	@Override
	public List<Room> selectMyRooms(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		String id = map.get("id").toString();
		
		int allRows = iroomDao.getCntAllMyRooms(id);
		int nowPage = (Integer)map.get("page");
		nowPage = nowPage-1;
		int rows = 10;
		int allPage = allRows / rows;
		int firstPage = (nowPage) / 10;// 1~10까지만 표시할 경우
		int lastPage = (nowPage) / 10 + 9;
		lastPage = allPage < lastPage ? allPage : lastPage; //마지막 페이지가 모든 페이지 갯수보다 큰 경우에
		map.put("idx", rows*nowPage);
		map.put("rows", rows);
		List<Room> list = iroomDao.selectMyRooms(map);
		System.out.println(list.get(0));		
		return list;
	}
	
	


//	@Override
//	public void addStudent(Student student) {
//		studentDao.insertStudent(student);
//		
//	}
//
//	@Override
//	public void modifyStudent(Student student) {
//		studentDao.updateStudent(student);
//	}
//
//	@Override
//	public void deleteStudent(int num) {
//		studentDao.deleteStudent(num);
//	}
//
//	@Override
//	public Student getStudent(int num) {
//		
//		return studentDao.selectOne(num);
//	}

