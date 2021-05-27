package com.tj.music.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.tj.music.dao.MusicDAO;
import com.tj.music.domain.MusicVO;
import com.tj.music.domain.SearchCriteria;

@Service
public class MusicServiceImpl implements MusicService {
	
	@Inject
	private MusicDAO dao;

	@Override
	public void write(MusicVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public MusicVO view(int bno) throws Exception {
		dao.Hit(bno);
		return dao.view(bno);
	}

	@Override
	public void modify(MusicVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return dao.countSearch(scri);
	}

	@Override
	public List<MusicVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}
	
}
