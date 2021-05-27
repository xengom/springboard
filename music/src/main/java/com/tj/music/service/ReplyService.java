package com.tj.music.service;

import java.util.List;

import com.tj.music.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> readReply(int bno) throws Exception;
}
