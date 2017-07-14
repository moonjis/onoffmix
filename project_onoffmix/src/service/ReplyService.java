package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IReplyDao;
import model.Reply;

@Service
public class ReplyService implements IReplyService{

	@Autowired
	private IReplyDao replyDao;
	
	
	public Reply selectReply(String replyer) throws Exception{
		return replyDao.selectId(replyer);
		
	}

	@Override
	public void addReply(Reply reply) throws Exception {
		replyDao.insertReply(reply);
		
	}

	@Override
	public List<Reply> getReplyList(int num) throws Exception {
		
		return replyDao.selectAll(num);
	}

	@Override
	public void modifyReply(Reply reply) throws Exception {
		replyDao.updateReply(reply);
		
	}

	@Override
	public void removeReply(int rno) throws Exception {
		replyDao.deleteReply(rno);
		
	}

	@Override
	public int getReplyCount(int num) throws Exception {
		
		return replyDao.getCount(num);
	}
	
	
	
}
