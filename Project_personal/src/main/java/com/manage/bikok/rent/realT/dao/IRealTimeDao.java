package com.manage.bikok.rent.realT.dao;

import java.util.ArrayList;

import com.manage.bikok.rent.realT.model.RealTimerVO;

public interface IRealTimeDao {
	
	public ArrayList<RealTimerVO> usingTimeList(); 
	
	public void timerStart(RealTimerVO RTVO);
	
	public void timerStop(RealTimerVO RTVO);
	
	
	public RealTimerVO getNo();


}
