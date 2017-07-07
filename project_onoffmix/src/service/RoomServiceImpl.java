package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IroomDao;
import model.Category;
import model.Room;



@Service
public class RoomServiceImpl implements RoomService {
	
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
		
		System.out.println(room);
		
//		board.setReadCount(board.getReadCount() + 1);
//		boardDao.updateBoard(board);
		return room;
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
}
