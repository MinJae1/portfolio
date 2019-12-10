package com.manage.bikok.info.bike.service;

import java.util.ArrayList;

import com.manage.bikok.info.bike.model.BikeVO;

public interface IBikeService {
	void newBike(BikeVO bike);

	ArrayList<BikeVO> bikeList();

	BikeVO bikeInfo(BikeVO bike);

	void modBike(BikeVO bike);

}
