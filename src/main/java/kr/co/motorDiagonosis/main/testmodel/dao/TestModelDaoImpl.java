package kr.co.motorDiagonosis.main.testmodel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.motorDiagonosis.main.testmodel.vo.TestModelVO;

@Repository
public class TestModelDaoImpl implements TestModelDao{

	@Autowired
	private SqlSession sql;
	
	@Override
	public List<TestModelVO> selectModelList(TestModelVO vo) {
		return sql.selectList("testmodel.selectModelList",vo);
	}
	
	@Override
	public int selectModelListTotal(TestModelVO vo) {
		return sql.selectOne("testmodel.selectModelListTotal",vo);
	}
	@Override
	public int selectModelListTotalRes(TestModelVO vo) {
		return sql.selectOne("testmodel.selectModelListTotalRes",vo);
	}
	@Override
	public int insertModel(TestModelVO vo) {
		return sql.insert("testmodel.insertModel",vo);
	}
	@Override
	public int updateModel(TestModelVO vo) {
		return sql.update("testmodel.updateModel",vo);
	}
	@Override
	public int deleteModel(TestModelVO vo) {
		return sql.delete("testmodel.deleteModel",vo);
	}
	
	@Override
	public List<TestModelVO> selectModelListAll(TestModelVO vo) {
		return sql.selectList("testmodel.selectModelListAll",vo);
	}

	@Override
	public int selectInstFlag(TestModelVO vo) {
		return sql.selectOne("testmodel.selectInstFlag", vo);
	}
	
}
