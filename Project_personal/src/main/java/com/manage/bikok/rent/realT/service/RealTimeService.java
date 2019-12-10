package com.manage.bikok.rent.realT.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.manage.bikok.rent.realT.dao.IRealTimeDao;
import com.manage.bikok.rent.realT.model.RealTimerVO;

@Service
public class RealTimeService implements IRealTimeService {

	@Inject
	IRealTimeDao realtimeDao;
	
	@Override
	public ArrayList<RealTimerVO> usingTimeList() {
		// TODO Auto-generated method stub
		return realtimeDao.usingTimeList();
	}

	@Override
	public void timerStart(RealTimerVO RTVO) {
		// TODO Auto-generated method stub
		realtimeDao.timerStart(RTVO);
	}

	@Override
	public void timerStop(RealTimerVO RTVO) {
		// TODO Auto-generated method stub
		realtimeDao.timerStop(RTVO);
	}


	@Override
	public RealTimerVO getNo() {
		// TODO Auto-generated method stub
		return realtimeDao.getNo();
	}

}
