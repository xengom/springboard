package com.tj.music.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tj.music.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace="com.tj.music.mappers.memberMapper";
	
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(namespace+".register",vo);
	}


	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace+".login", vo);
	}

}
