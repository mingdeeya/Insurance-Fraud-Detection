package com.stack.ins.product.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.stack.ins.product.dao.IProductRepository;
import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;
import com.stack.ins.product.service.IProductService;
@Service
public class ProductService implements IProductService {

	@Autowired
	IProductRepository productDao;
	
	@Override
	public void insertCustData(Cust cust) {
		System.out.println("서비스에 전달 완료!");
		productDao.insertCustData(cust);

	}

	@Override
	public void insertClaimData(Claim claim) {
		productDao.insertClaimData(claim);
	}

	@Override
	public int selectLastDataNumber() {
		return productDao.selectLastDataNumber();
	}

}
