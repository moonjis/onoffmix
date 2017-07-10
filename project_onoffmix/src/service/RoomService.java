package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import model.Category;
import model.Room;


public interface RoomService {
	public List<Room> getRoomList();
	public List<Category> getCategoryList();
	public Room readRoom(int num);
	public boolean createRoom(Room room, MultipartFile file);


}
