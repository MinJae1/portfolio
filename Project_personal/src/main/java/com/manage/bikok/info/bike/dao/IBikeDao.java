package com.manage.bikok.info.bike.dao;

import java.util.ArrayList;

import com.manage.bikok.info.bike.model.BikeVO;

public interface IBikeDao {
	void newBike(BikeVO bike);

	ArrayList<BikeVO> bikeList();

	BikeVO bikeInfo(BikeVO bike);

	void modBike(BikeVO bike);
}
