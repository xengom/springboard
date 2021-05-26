package com.tj.music.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tj.music.domain.MusicVO;

@Repository
public class MusicDAOImpl implements MusicDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.tj.music.mappers.music";
	
	@Override
	public List<MusicVO> list() throws Exception {
		return sql.selectList(namespace+".list");
	}

}
