package com.tj.music.service;

import com.tj.music.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;
	public MemberVO login(MemberVO vo) throws Exception;
	public void modify(MemberVO vo) throws Exception;
}
