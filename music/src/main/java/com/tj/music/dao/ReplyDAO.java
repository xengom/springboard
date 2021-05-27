package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.ReplyVO;

public interface ReplyDAO {
	//조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	//작성
	public void writeReply(ReplyVO vo)throws Exception;
}
