package test.code.study.dao;

import java.util.List;
import java.util.Map;

import test.code.study.model.EmpVO;

public interface IEmpRepository {
	int getEmpCount();

	int getEmpCount(int deptid);

	List<EmpVO> getEmpList();

	EmpVO getEmpInfo(int empid);

	void updateEmp(EmpVO emp);

	void insertEmp(EmpVO emp);

	void deleteJobHistory(int empid);

	void deleteEmp(int empid, String email);

	List<Map<String, Object>> getAllDeptId();

	List<Map<String, Object>> getAllJobId();

	List<Map<String, Object>> getAllManagerId();
}
