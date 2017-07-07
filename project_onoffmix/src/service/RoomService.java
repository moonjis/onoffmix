package service;

import java.util.List;


import model.Category;
import model.Room;


public interface RoomService {
	public List<Room> getRoomList();
	public List<Category> getCategoryList();
	public Room readRoom(int num);


}
