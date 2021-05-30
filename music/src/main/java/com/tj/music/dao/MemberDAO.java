package com.tj.music.dao;

import com.tj.music.domain.MemberVO;

public interface MemberDAO {
	public void register(MemberVO vo) throws Exception;
}
