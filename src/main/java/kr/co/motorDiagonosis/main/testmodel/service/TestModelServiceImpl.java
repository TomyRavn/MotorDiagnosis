package kr.co.motorDiagonosis.main.testmodel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.motorDiagonosis.main.testmodel.dao.TestModelDao;
import kr.co.motorDiagonosis.main.testmodel.vo.TestModelVO;

@Service
public class TestModelServiceImpl implements TestModelService{
	
	@Autowired
	private TestModelDao testModelDao;
	
	@Override
	public List<TestModelVO> selectModelList(TestModelVO vo) {
		return testModelDao.selectModelList(vo);
	}
	
	@Override
	public int selectModelListTotal(TestModelVO vo) {
		return testModelDao.selectModelListTotal(vo);
	}
	
	@Override
	public int selectModelListTotalRes(TestModelVO vo) {
		return testModelDao.selectModelListTotalRes(vo);
	}
	
	@Override
	public int insertModel(TestModelVO vo) {
		return testModelDao.insertModel(vo);
	}
	
	@Override
	public int updateModel(TestModelVO vo) {
		return testModelDao.updateModel(vo);
	}
	
	@Override
	public int deleteModel(TestModelVO vo) {
		return testModelDao.deleteModel(vo);
	}
	
	@Override
	public List<TestModelVO> selectModelListAll(TestModelVO vo) {
		return testModelDao.selectModelListAll(vo);
	}

	@Override
	public int selectInstFlag(TestModelVO vo) {
		return testModelDao.selectInstFlag(vo);
	}
	
}
