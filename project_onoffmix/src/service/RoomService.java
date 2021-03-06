package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import model.Category;
import model.Room;


public interface RoomService {
	
	public List<Category> getCategoryList();
	public Room readRoom(int num);
	public boolean createRoom(HttpServletRequest req, Room room, MultipartFile file);
	public boolean joinRoom(String id, Room room);
	public boolean deleteRoom(int num);
	public boolean updateRoom(Room room);
	public boolean outRoom(int num);
	public boolean updateBoard(Room room);
	public HashMap<String,Object> selectMyRooms(HashMap<String, Object> map);
	public HashMap<String,Object> selectJoinRooms(HashMap<String, Object> params);
	public HashMap<String, Object> getRoomList(int page);
	
}
