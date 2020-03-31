package com.stack.ins.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stack.ins.member.dao.IMemberRepository;
import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;
@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberDao;
	
	@Override
	public void insertMember(Member member) {
		memberDao.insertMember(member);

	}

	@Override
	public Member selectMember(String userid) {
		return memberDao.selectMember(userid);

	}

	@Override
	public List<Member> selectAllMembers() {
		// TODO Auto-generated method stub
		return memberDao.selectAllMembers();
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);

	}

	@Override
	public void saveDeleteMember(Member member) {
		// TODO Auto-generated method stub
		memberDao.saveDeleteMember(member);

	}

	@Override
	public Member getDeleteMember(int deleteCount) {
		return memberDao.getDeleteMember(deleteCount);
		

	}

	@Override
	public void deleteMember(Member member) {
		memberDao.deleteMember(member);

	}

	@Override
	public String getPassword(String userid) {
		return memberDao.getPassword(userid);
	}

}
