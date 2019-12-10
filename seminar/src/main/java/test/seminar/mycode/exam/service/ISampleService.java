package test.seminar.mycode.exam.service;

import java.util.List;

import test.seminar.mycode.exam.model.SampleVO;

public interface ISampleService {
//	int getWrListCount();

	int getWrListSearchCount(String word);

	List<SampleVO> getWrList(String word);

	SampleVO wrDetailView(int wrId);

	void insertWriting(SampleVO wrVo);

	void updateWriting(SampleVO wrVo);

	void deleteWriting(int wrId);

}
