package com.tj.music.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.tj.music.dao.ReplyDAO;
import com.tj.music.domain.ReplyVO;

@Repository
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

}
