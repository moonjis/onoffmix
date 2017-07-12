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
	public void insertAttach(HashMap<String, Object> params);
	public int getCount();

	
	
}
