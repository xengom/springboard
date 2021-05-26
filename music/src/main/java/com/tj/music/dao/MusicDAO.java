package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.MusicVO;

public interface MusicDAO {
	public List<MusicVO> list() throws Exception;
	public void write(MusicVO vo) throws Exception;
}
