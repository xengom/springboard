package com.tj.music.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tj.music.domain.MusicVO;
import com.tj.music.domain.SearchCriteria;

@Repository
public class MusicDAOImpl implements MusicDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.tj.music.mappers.music";


	@Override
	public void write(MusicVO vo) throws Exception {
		sql.insert(namespace+".write",vo);
	}

	@Override
	public MusicVO view(int bno) throws Exception {
		return sql.selectOne(namespace+".view",bno);
	}

	@Override
	public void modify(MusicVO vo) throws Exception {
		sql.update(namespace+".modify",vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace+".delete",bno);
	}

	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace+".count");
	}

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace+".countSearch",scri);
	}

	@Override
	public List<MusicVO> listSearch(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace+".listSearch", scri);
	}

	@Override
	public void Hit(int bno) throws Exception {
		sql.update(namespace+".Hit", bno);
	}
	
	

}
