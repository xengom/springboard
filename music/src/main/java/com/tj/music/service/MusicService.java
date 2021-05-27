package com.tj.music.service;

import java.util.List;

import com.tj.music.domain.MusicVO;
import com.tj.music.domain.SearchCriteria;

public interface MusicService {
	public void write(MusicVO vo) throws Exception;
	public MusicVO view(int bno) throws Exception;
	public void modify(MusicVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	//총 게시물 개수
	public int count() throws Exception;
	//조건에 맞는 게시물 개수
	public int countSearch(SearchCriteria scri) throws Exception;
	//목록 + 페이징 + 검색
	public List<MusicVO> listSearch(SearchCriteria scri) throws Exception;
}
