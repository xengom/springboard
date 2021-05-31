package com.tj.music.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tj.music.dao.MemberDAO;
import com.tj.music.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

}
