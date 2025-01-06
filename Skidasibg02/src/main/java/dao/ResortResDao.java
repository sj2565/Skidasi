package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.ResortPrice;
import bean.ResortRes;

@Component("resdao")
public class ResortResDao {
	private final String namespace = "MapperResortRes.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public ResortResDao() {
	}
	
	public List<ResortPrice> SelectPriceData() {
		return this.abcd.selectList(namespace+"SelectPriceData");
	}

	public ResortPrice SelectPriceDataByPk(String pr_no) {
		return this.abcd.selectOne(namespace+"SelectPriceDataByPk",pr_no);
	}

	//예매하기 
	public int InsertData(ResortRes res) {
		return this.abcd.insert(namespace+"InsertData", res);
	}

	//예매 내역 확인 (개인용) 
	public List<ResortRes> SelectDataList(String member_id) {
		return this.abcd.selectList(namespace+"SelectDataList", member_id);
	}

	//예매 내역 확인 (관리자)
	public List<ResortRes> SelectDataListforAdmin() {
		return this.abcd.selectList(namespace+"SelectDataListforAdmin");
	}

	// 예약 취소
	public int CancelResByPk(String res_no) {
		return this.abcd.update(namespace+"CancelResByPk", res_no);
	}
	
}
