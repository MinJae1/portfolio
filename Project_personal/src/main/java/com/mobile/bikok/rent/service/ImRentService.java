package com.mobile.bikok.rent.service;

import com.mobile.bikok.rent.model.MRentVO;

public interface ImRentService {
	void RentBike(MRentVO mRentVO);

	void ReturnBike(MRentVO mRentVO);

	int getNo(MRentVO mRentVO);

	void runningTimeUpdate(MRentVO mRentVO);

	MRentVO getPosition(MRentVO mRentVO);

}
