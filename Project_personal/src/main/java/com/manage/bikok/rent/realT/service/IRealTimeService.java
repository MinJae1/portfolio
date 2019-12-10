package com.manage.bikok.rent.realT.service;

import java.util.ArrayList;

import com.manage.bikok.rent.realT.model.RealTimerVO;

public interface IRealTimeService {

	public ArrayList<RealTimerVO> usingTimeList();

	public void timerStart(RealTimerVO RTVO);

	public void timerStop(RealTimerVO RTVO);


	public RealTimerVO getNo();

}
