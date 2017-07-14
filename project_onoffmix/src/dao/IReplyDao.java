package dao;

import java.util.List;

import model.Reply;

public interface IReplyDao {

	public void insertReply(Reply reply);
	public void updateReply(Reply reply);
	public void deleteReply(int rno);
	public Reply selectOne(int rno);
	public List<Reply> selectAll(int num);

	public int getCount(int num);
	
	public Reply selectId(String replyer);
	}
