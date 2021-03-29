package kr.co.motorDiagonosis.main.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.motorDiagonosis.main.common.vo.Pager;
import kr.co.motorDiagonosis.main.testmodel.service.TestModelService;
import kr.co.motorDiagonosis.main.testmodel.vo.TestModelVO;

@Controller
public class HomeController {
	
	@Autowired
	private TestModelService testModelService;
	
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "/selectModel")
	public Map<String, Object> selectModel(TestModelVO vo) {
		
		Map<String, Object> data= new HashMap<String, Object>();
		vo.setTotal(testModelService.selectModelListTotal(vo));
		data.put("pager", (Pager)vo);
		vo.setResult_nm("정상");
		data.put("resTotal", testModelService.selectModelListTotalRes(vo));
		data.put("modelList", testModelService.selectModelList(vo));
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectModelAll")
	public Map<String, Object> selectModelAll(TestModelVO vo) {
		
		
		
		Map<String, Object> data= new HashMap<String, Object>();
		data.put("selectModelListAll", testModelService.selectModelListAll(vo));
		
		return data;
	}
	
	
	   @ResponseBody
	   @RequestMapping(value = "/insertModel")
	   public Map<String, Object> insertModel(TestModelVO vo) {
	      
	      int res = testModelService.insertModel(vo);
	      
	      Map<String, Object> data= new HashMap<String, Object>();
	      
	      data.put("res", res);
	      
	      return data;
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "/updateModel")
	   public Map<String, Object> updateModel(TestModelVO vo) {
	      
	      int res = testModelService.updateModel(vo);
	      
	      Map<String, Object> data= new HashMap<String, Object>();
	      
	      data.put("res", res);
	      
	      return data;
	   }
	   
}