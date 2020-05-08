package com.stack.ins.product.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stack.ins.member.model.CustManager;
import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;
import com.stack.ins.product.model.Cust;
import com.stack.ins.product.service.IProductService;

import jdk.internal.instrumentation.InstrumentationMethod;

@Controller
public class ProductController {
	
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IMemberService memberService;
	/*
	 * @PostMapping("/product") public String inputCustData(HttpServletRequest
	 * httpServletRequest) {
	 * 
	 * String age = httpServletRequest.getParameter("age"); System.out.println(age);
	 * return "services"; }
	 */
	
//	데이터 값 하나 입력하기
	@PostMapping("/product/{custManagerId}")
	public String inputCustData(Cust cust, Model model, @PathVariable int custManagerId) {
			
	
		try {
			System.out.println("현재 들어오는 값은 :"+ cust);
			// cust_data 마리아 db에  값넣기
			productService.insertCustData(cust);
			//  cust_id 값 마리아 db에서 불러 오기
			int custId = productService.selectLastDataNumber();
			System.out.println("custid:"+custId);
			System.out.println("custManagerId:"+custManagerId);
			System.out.println("마리아 db에  저장 완료");
			model.addAttribute("message", "마리아 db에 저장 완료");
			model.addAttribute("custId", custId);
			
			// cust_id 값 db에 넣기 
			memberService.insertCustId(custManagerId, custId);
			System.out.println("오라클에 cust_id 저장 완료!!!");
			return "product/services";
		} catch (Exception e) {
			e.printStackTrace();
			return "common/error";
		}
	}

	
	@GetMapping("/product/services")
	public String goServicePage() {
		
		return "/product/services";
	}
	//cust_id 값 리스트 보여주기 
	@GetMapping("/product/list/{custManagerId}")
	@ResponseBody
	public List<CustManager> getCustList(@PathVariable int custManagerId) {
		try {
			System.out.println("custManagerId:"+custManagerId);
			List<CustManager> custList = memberService.getCustId(custManagerId);
			System.out.println("custList:" +custList);
			return custList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	
	}
	
	
	
	
}
