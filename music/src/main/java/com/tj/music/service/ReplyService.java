package com.tj.music.service;

import java.util.List;

import com.tj.music.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> readReply(int bno) throws Exception;
	public void writeReply(ReplyVO vo) throws Exception;
	public ReplyVO readReplySelect(int rno) throws Exception;
	public void replyUpdate(ReplyVO vo) throws Exception;
	public void replyDelete(ReplyVO vo) throws Exception;
}
