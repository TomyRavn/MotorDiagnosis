package kr.co.motorDiagonosis.main.testmodel.dao;

import java.util.List;

import kr.co.motorDiagonosis.main.testmodel.vo.TestModelVO;

public interface TestModelDao {

	List<TestModelVO> selectModelList(TestModelVO vo);
	int selectModelListTotal(TestModelVO vo);
	int selectModelListTotalRes(TestModelVO vo);
	int insertModel(TestModelVO vo);
	int updateModel(TestModelVO vo);
	int deleteModel(TestModelVO vo);
	int selectInstFlag(TestModelVO vo);
	List<TestModelVO> selectModelListAll(TestModelVO vo);
}