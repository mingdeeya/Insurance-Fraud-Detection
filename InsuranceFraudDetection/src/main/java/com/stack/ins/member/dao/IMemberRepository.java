package com.stack.ins.member.dao;

import java.util.List;

import com.stack.ins.member.model.Member;

public interface IMemberRepository {
//	회원 가입
	void insertMember(Member member);
//  특정 회원 선택 
	Member selectMember(String userid);
//	모든 회원 선택
	List<Member> selectAllMembers();
//  회원 정보 수정하기
 	void updateMember(Member member);
// 	회원 삭제 (db 에는 삭제하지 않음) 기본 0  삭제시 1 -> 북구도 가능 함 
	Member saveDeleteMember(Member member);
//  삭제된 아이디 가져오기(db에서 삭제 되지 않음)
	Member getDeleteMember(int deleteCount);
//  회원 삭제 (db 에서 완전히 삭제)
	void deleteMember(Member member);
//  비밀번호 가져오기 
	String getPassword(String userid);
}