package model;

import java.util.Date;

public class Reply {

	private int rno;
	private int num;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	
	
	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", num=" + num + ", replytext=" + replytext + ", replyer=" + replyer + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
}
