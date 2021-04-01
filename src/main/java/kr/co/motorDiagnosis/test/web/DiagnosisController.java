package kr.co.motorDiagnosis.test.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import jep.Jep;
import kr.co.motorDiagnosis.main.testmodel.service.TestModelService;
import kr.co.motorDiagnosis.main.testmodel.vo.TestModelVO;

@Controller
@RequestMapping("/diagnosis")
public class DiagnosisController {
	
	@Autowired
	private TestModelService testModelService;
	
	int minNum = 0;
	
	/** 현대 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/hyundae1DepthList")
	public String hyundae1DepthList(ModelMap model) throws Exception{
		
		minNum = testModelService.selectMinItem();
		model.addAttribute("minNum", minNum);
		
		try(Jep jep = new Jep(false)) {
			jep.eval("import numpy");
			jep.eval("import os");
			jep.eval("import plotly");
		}
		
		return "hyundae/hyundae1DepthList";
		
	}
	
	
	
	@RequestMapping("/hyundae2DepthList")
	public String hyundae2DepthList(ModelMap model, int item_sn) {
		
		model.addAttribute("item_sn",item_sn);
		
		minNum = testModelService.selectMinItem();
		model.addAttribute("minNum", minNum);
		
		TestModelVO vo = new TestModelVO();
		vo.setItem_sn(item_sn);
		
		int selectInstFlag = testModelService.selectInstFlag(vo);
		
		if(selectInstFlag == 1) {
			testModelService.updateModel(vo);
		}
		
		return "hyundae/hyundae2DepthSelected2";
		
	}
	
	@RequestMapping("/hyundae2DepthList/deleteModel")
	public String deleteModel(ModelMap model, int item_sn) {
		
		TestModelVO testModelVO = new TestModelVO();
		testModelVO.setItem_sn(item_sn);
		
		testModelService.deleteModel(testModelVO);
		
		return "hyundae/hyundae1DepthList";
		
	}
	
	@RequestMapping("/hyundae2DepthSelected2")
	public String hyundae2DepthSelected2(ModelMap model) {
		
		return "hyundae/hyundae2DepthSelected2";
		
	}
}