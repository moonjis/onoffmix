package service;

import java.util.List;

import model.Reply;

public interface IReplyService {

	public void addReply(Reply reply) throws Exception;
	public List<Reply>getReplyList(int num) throws Exception;
	public void modifyReply(Reply reply) throws Exception;
	public void removeReply(int rno) throws Exception;
	public int getReplyCount(int num) throws Exception;
}
