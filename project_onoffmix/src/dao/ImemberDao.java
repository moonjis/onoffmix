package dao;

import java.util.HashMap;

import model.Member;

public interface ImemberDao {
 public int insertMember(HashMap<String,Object> member);
 public Member selectOne(String id);
 public int updateOne(HashMap<String,Object> member);
}
