package com.tj.music.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tj.music.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace="com.tj.music.mappers.reply";
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sql.selectList(namespace+".readReply", bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert(namespace+".writeReply", vo);
	}

}
