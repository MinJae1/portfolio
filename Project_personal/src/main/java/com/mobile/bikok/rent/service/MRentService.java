package com.mobile.bikok.rent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobile.bikok.rent.dao.ImRentDao;
import com.mobile.bikok.rent.model.MRentVO;

@Service
public class MRentService implements ImRentService {

	@Autowired
	ImRentDao mRentDao;

	@Override
	public void RentBike(MRentVO mRentVO) {
		mRentDao.RentBike(mRentVO);
	}

	@Override
	public void ReturnBike(MRentVO mRentVO) {
		// TODO Auto-generated method stub
		mRentDao.ReturnBike(mRentVO);

	}

	@Override
	public int getNo(MRentVO mRentVO) {
		// TODO Auto-generated method stub
		return mRentDao.getNo(mRentVO);
	}

	@Override
	public void runningTimeUpdate(MRentVO mRentVO) {
		// TODO Auto-generated method stub
		mRentDao.runningTimeUpdate(mRentVO);
	}

	@Override
	public MRentVO getPosition(MRentVO mRentVO) {
		// TODO Auto-generated method stub
		return mRentDao.getPosition(mRentVO);
	}

}
