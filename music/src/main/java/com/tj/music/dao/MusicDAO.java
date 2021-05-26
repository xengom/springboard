package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.Criteria;
import com.tj.music.domain.MusicVO;
import com.tj.music.domain.SearchCriteria;

public interface MusicDAO {
	//목록
	public List<MusicVO> list() throws Exception;
	public void write(MusicVO vo) throws Exception;
	public MusicVO view(int bno) throws Exception;
	public void modify(MusicVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	
	//페이지 총개수
	public int count() throws Exception;
	//목록+페이징
	public List<MusicVO> listPage(Criteria cri) throws Exception;
	//조건에 맞는 페이지 개수
	public int countSearch(SearchCriteria scri) throws Exception;
	//목록+페이징+검색
	public List<MusicVO> listSearch(SearchCriteria scri) throws Exception;
}
