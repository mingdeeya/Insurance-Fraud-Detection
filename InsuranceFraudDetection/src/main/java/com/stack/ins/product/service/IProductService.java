package com.stack.ins.product.service;

import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;

public interface IProductService {

//	고객 데이터 값 넣기
	void insertCustData(Cust cust);
	
//  고객 청구 데이터 값 넣기	
	void insertClaimData(Claim claim);
	// 마지막 데이터 번호값 가져오기
	int selectLastDataNumber();	
}
