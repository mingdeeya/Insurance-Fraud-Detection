package com.stack.ins.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;


@Controller
public class AdminController {
	
@Autowired	
IMemberService memberService;
	
	@GetMapping(value="/admin")
	public String showMemberList(Model model) {
		List<Member> memberList = memberService.selectAllMembers();
		model.addAttribute("memberList", memberList);
		return "admin/admin2";
	}
	

	
	@GetMapping(value="/admin/login")
	public String goToAdminPage() {
		
		return "admin/adminLogin";
	}
	
	@PostMapping(value="/admin/login")
	public String goToAdminPage(String userId, String password, HttpSession session) {
		
		
		return "admin/admin";
	}
	
	
	
}
