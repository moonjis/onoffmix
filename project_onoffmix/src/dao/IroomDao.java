package dao;

import java.util.List;

import model.Category;
import model.Room;

public interface IroomDao {
	public List<Room> selectAll();
	public List<Category> selectCategory();
	public Room selectOne(int num);
	
}
