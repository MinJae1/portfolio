package test.seminar.mycode.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import test.seminar.mycode.exam.dao.ISampleRepository;
import test.seminar.mycode.exam.model.SampleVO;

public class SampleService implements ISampleService {

	@Autowired
	@Qualifier("ISampleRepository")
	ISampleRepository sampleRepository;

//	@Override
//	public int getWrListCount() {
//		// TODO Auto-generated method stub
//		return sampleRepository.getWrListCount();
//	}

	@Override
	public int getWrListSearchCount(String word) {
		// TODO Auto-generated method stub
		return sampleRepository.getWrListSearchCount(word);
	}

	@Override
	public List<SampleVO> getWrList(String word) {
		// TODO Auto-generated method stub
		return sampleRepository.getWrList(word);
	}

	@Override
	public SampleVO wrDetailView(int wrId) {
		// TODO Auto-generated method stub
		return sampleRepository.wrDetailView(wrId);
	}

	@Override
	public void insertWriting(SampleVO wrVo) {
		// TODO Auto-generated method stub
		sampleRepository.insertWriting(wrVo);

	}

	@Override
	public void updateWriting(SampleVO wrVo) {
		// TODO Auto-generated method stub
		sampleRepository.updateWriting(wrVo);
	}

	@Override
	public void deleteWriting(int wrId) {
		// TODO Auto-generated method stub
		sampleRepository.deleteWriting(wrId);
	}

}
