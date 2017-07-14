package dao;

import java.util.HashMap;
import java.util.List;


import model.Category;
import model.Room;

public interface IroomDao {
	public List<Room> selectAll();
	public List<Category> selectCategory();
	public Room selectOne(int num);
	public void insertRoom(Room room);
	public void updateRoom(Room room);
	public void deleteRoom(int num);
	public void deleteAttach(int num);
	public void updateCount(Room room);
	public void joinRoom(HashMap<String, Object> params);
	public void outRoom(int num);
	public void insertAttach(HashMap<String, Object> params);
	public int getCount();
	public List<Room> selectMyRooms(HashMap<String, Object> map);
	public int getCntAllMyRooms(String id);	
}
