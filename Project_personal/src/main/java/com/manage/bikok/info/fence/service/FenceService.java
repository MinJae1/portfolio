package com.manage.bikok.info.fence.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.manage.bikok.info.fence.dao.IFenceDao;
import com.manage.bikok.info.fence.model.FenceVO;

@Service
public class FenceService implements IFenceService {

	@Inject
	IFenceDao fenceDao;

	@Override
	public ArrayList<FenceVO> fenceList() {
		// TODO Auto-generated method stub
		return fenceDao.fenceList();
	}

	@Override
	public void addFence(FenceVO fenceVO) {
		// TODO Auto-generated method stub
		fenceDao.addFence(fenceVO);
	}

	@Override
	public FenceVO getFence(FenceVO fenceVO) {
		return fenceDao.getFence(fenceVO);
	}

	@Override
	public void modifyFence(FenceVO fenceVO) {
		// TODO Auto-generated method stub
		fenceDao.modifyFence(fenceVO);
	}

}
