package com.tj.music.dao;

import java.util.List;

import com.tj.music.domain.ReplyVO;

public interface ReplyDAO {
	//조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	//작성
	public void writeReply(ReplyVO vo)throws Exception;
	//특정댓글조회
	public ReplyVO readReplySelect(int rno) throws Exception;
	//수정
	public void replyUpdate(ReplyVO vo) throws Exception;
	//삭제
	public void replyDelete(ReplyVO vo) throws Exception;
}
