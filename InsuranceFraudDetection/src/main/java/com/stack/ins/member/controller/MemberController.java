package com.stack.ins.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;
@Controller
public class MemberController {
		
	@Autowired
	IMemberService memberService;

//	로그인 폼으로 가기 
/* @RequestMapping(value="/member/login", method=RequestMethod.GET) */
	@GetMapping(value="/member/login")
	public String loginForm() {
		return "member/login_form";
	}
//  로그인 하기
	@PostMapping(value="/member/login")
	public String login(String userid, String password, HttpSession session, Model model) {
		Member member = memberService.selectMember(userid);
		if(member != null) {
			String dbPassword = member.getPassword();
			// 아이디가 없음
			if(dbPassword == null) {
				model.addAttribute("message", "존재하지 않는 아이디 입니다.");
			}else {
				// 아이디 있음 
				if(dbPassword.equals(password)) {
					// 비밀번호 일치
					// 세션에  회원 정보를 넣어 준다. 
					session.setAttribute("userid", userid);
					session.setAttribute("name", member.getName());
					session.setAttribute("email",member.getEmail());
					model.addAttribute("message", "로그인 성공");
					return "home";
				}else {
					//비밀번호 불일치
					model.addAttribute("message", "비밀번호가 다릅니다.");
				}
			}
		}else {
			model.addAttribute("message", "USER_NOT_FOUND");
		}
		session.invalidate();
		return "home";
	}
// 회원 가입 폼으로 가기 
	@GetMapping(value="/member/sign")
	public String singupForm() {
		return "member/signup_form";
	}
//  회원 가입 하기 	
	@PostMapping(value="/member/sign")
	public String memberInsert(Member member, Model model, HttpSession session) {
		memberService.insertMember(member);
		session.invalidate();
		return "home";
	}

//  로그아웃 하기 ( 만들고 좀 더 생각해보기 - > 로그인한 페이지로 리다이랙트 하는건 어떨까????)
	@GetMapping(value="/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
//  아이디 수정하기 폼으로 가기
	@GetMapping(value="/member/update")
	public String updateMember(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null && !userid.equals("")) {
			Member member = memberService.selectMember(userid);
			model.addAttribute("member", member);
			model.addAttribute("message", "업데이트");
			return "member/user_update_form";
		}else {
			model.addAttribute("message", "로그인을 하세요");
			return "member/login_form";
		}	
	}
	
//  아이디 수정하기
	@PostMapping(value="/member/update")
	public String updateMember(Member member, HttpSession session, Model model) {
		try {
			memberService.updateMember(member);
			model.addAttribute("member", member);
			model.addAttribute("message", "회원가입 성공!");
			return "member/login_form";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
//			에러 페이지로 보내기
			return "error/page";
		}
	}
	
}
