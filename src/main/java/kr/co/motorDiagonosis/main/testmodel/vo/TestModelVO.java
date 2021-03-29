package kr.co.motorDiagonosis.main.testmodel.vo;

import kr.co.motorDiagonosis.main.common.vo.Pager;

public class TestModelVO extends Pager{

	private int item_sn;
	private String org_nm;
	private String model_nm;
	private String model_dttm;
	private String type_nm;
	private String result_nm;
	private int inst_flag;
	private int err_flag;
	
	private String stdt;
	private String eddt;
	
	public String getStdt() {
		return stdt;
	}
	public void setStdt(String stdt) {
		this.stdt = stdt;
	}
	public String getEddt() {
		return eddt;
	}
	public void setEddt(String eddt) {
		this.eddt = eddt;
	}
	public int getItem_sn() {
		return item_sn;
	}
	public void setItem_sn(int item_sn) {
		this.item_sn = item_sn;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getModel_nm() {
		return model_nm;
	}
	public void setModel_nm(String model_nm) {
		this.model_nm = model_nm;
	}
	public String getModel_dttm() {
		return model_dttm;
	}
	public void setModel_dttm(String model_dttm) {
		this.model_dttm = model_dttm;
	}
	public String getType_nm() {
		return type_nm;
	}
	public void setType_nm(String type_nm) {
		this.type_nm = type_nm;
	}
	public String getResult_nm() {
		return result_nm;
	}
	public void setResult_nm(String result_nm) {
		this.result_nm = result_nm;
	}
	public int getInst_flag() {
		return inst_flag;
	}
	public void setInst_flag(int inst_flag) {
		this.inst_flag = inst_flag;
	}
	public int getErr_flag() {
		return err_flag;
	}
	public void setErr_flag(int err_flag) {
		this.err_flag = err_flag;
	}
	
}
