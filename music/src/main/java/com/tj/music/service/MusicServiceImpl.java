package com.tj.music.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tj.music.dao.MusicDAO;
import com.tj.music.domain.Criteria;
import com.tj.music.domain.MusicVO;

@Service
public class MusicServiceImpl implements MusicService {
	
	@Inject
	private MusicDAO dao;
	
	@Override
	public List<MusicVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(MusicVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public MusicVO view(int bno) throws Exception {
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
	public List<MusicVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

}
