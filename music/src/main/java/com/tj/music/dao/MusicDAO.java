package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.MusicVO;
import com.tj.music.domain.SearchCriteria;

public interface MusicDAO {
	public void write(MusicVO vo) throws Exception;
	public MusicVO view(int bno) throws Exception;
	public void modify(MusicVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	
	//페이지 총개수
	public int count() throws Exception;
	//조건에 맞는 페이지 개수
	public int countSearch(SearchCriteria scri) throws Exception;
	//목록+페이징+검색
	public List<MusicVO> listSearch(SearchCriteria scri) throws Exception;
	//게시물조회수
	public void Hit(int bno) throws Exception;
}
