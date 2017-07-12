package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import model.Category;
import model.Room;


public interface RoomService {
	public List<Room> getRoomList();
	public List<Category> getCategoryList();
	public Room readRoom(int num);
	public boolean createRoom(HttpServletRequest req, Room room, MultipartFile file);
	public boolean updateBoard(Room room);


}
