package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.Criteria;
import com.tj.music.domain.MusicVO;

public interface MusicDAO {
	public List<MusicVO> list() throws Exception;
	public void write(MusicVO vo) throws Exception;
	public MusicVO view(int bno) throws Exception;
	public void modify(MusicVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	public int count() throws Exception;
	public List<MusicVO> listPage(Criteria cri) throws Exception;
}
