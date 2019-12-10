package com.manage.bikok.info.fence.service;

import java.util.ArrayList;

import com.manage.bikok.info.fence.model.FenceVO;

public interface IFenceService {
	ArrayList<FenceVO> fenceList();

	void addFence(FenceVO fenceVO);

	FenceVO getFence(FenceVO fenceVO);

	void modifyFence(FenceVO fenceVO);

}
