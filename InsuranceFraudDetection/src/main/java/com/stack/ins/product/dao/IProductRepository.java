package com.stack.ins.product.dao;

import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;

public interface IProductRepository {

	// 고객 정보 넣기
	void insertCustData(Cust cust);
	
	// 고객 요청 데이터 넣기
	void insertClaimData(Claim claim);
	// 마지막 데이터 번호값 가져오기
	int selectLastDataNumber();
	
}
