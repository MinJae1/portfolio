package com.manage.bikok.info.bike.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.bikok.info.bike.dao.IBikeDao;
import com.manage.bikok.info.bike.model.BikeVO;

@Service
public class BikeService implements IBikeService {

	@Autowired
	IBikeDao bikeDao;

	@Override
	public void newBike(BikeVO bike) {
		// TODO Auto-generated method stub
		bikeDao.newBike(bike);
	}

	@Override
	public ArrayList<BikeVO> bikeList() {
		// TODO Auto-generated method stub
		return bikeDao.bikeList();
	}

	@Override
	public BikeVO bikeInfo(BikeVO bike) {
		// TODO Auto-generated method stub
		return bikeDao.bikeInfo(bike);
	}

	@Override
	public void modBike(BikeVO bike) {
		// TODO Auto-generated method stub
		bikeDao.modBike(bike);
	}

}
