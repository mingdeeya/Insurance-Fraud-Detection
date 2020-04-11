package com.stack.ins.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;


@Controller
public class AdminController {
	
@Autowired	
IMemberService memberService;
	

// ++++++++++++++++++++++++++++++++ USER 관리 +++++++++++++++++++++++++++++++++++++++++++++++++
	@GetMapping(value="/admin")
	public String showMemberList(Model model) {
		List<Member> memberList = memberService.selectAllMembers();
		model.addAttribute("memberList", memberList);
		return "admin/main";
	}
	

//  어드민 로그인으로 가기
	@GetMapping(value="/admin/login")
	public String goToAdminPage() {
		
		return "admin/adminLogin";
	}
	
// 어드민 로그인으로 가서 검증 받기
	@PostMapping(value="/admin/login")
	public String goToAdminPage(String userId, String password, HttpSession session) {
		
		
		return "admin/main";
	}
//	어드민 USER PROFILE 로 가기 
	@GetMapping(value= {"/admin/user/{userId}", "/admin/user"})
	public String goToUser(@PathVariable String userId, Model model) {
		Member member = memberService.selectMember(userId);
		model.addAttribute("member", member);
		return "admin/user";
	}
	@GetMapping(value="/admin/table")
	public String goToUserTable(Model model) {
		List<Member> memberList = memberService.selectAllMembers();
		model.addAttribute("memberList", memberList);
		return "admin/tables";
	}
	

// ++++++++++++++++++++++++++++++++ BOARD관리 +++++++++++++++++++++++++++++++++++++++++++++++++
	
	
	
}
