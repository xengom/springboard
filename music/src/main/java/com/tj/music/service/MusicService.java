package com.tj.music.service;

import java.util.List;

import com.tj.music.domain.MusicVO;

public interface MusicService {
	public List<MusicVO> list() throws Exception;
}
