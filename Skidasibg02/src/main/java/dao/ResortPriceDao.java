package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.ResortInfo;
import bean.ResortPrice;

@Component("pdao")
public class ResortPriceDao {
	private final String namespace = "MapperResortPrice.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public ResortInfo SelectResortInfoByPk(String resort_no) {
		return this.abcd.selectOne(namespace+"SelectResortInfoByPk",resort_no);
	}

	public int InsertData(ResortPrice resortPrice) {
		return this.abcd.insert(namespace+"InsertData", resortPrice);
	}	

	public List<ResortPrice> SelectData() {
		return this.abcd.selectList(namespace+"SelectData");
	}

	public int DeleteData(String price_no) {
		return this.abcd.delete(namespace+"DeleteData", price_no);
	}

	public ResortPrice SelectResortPriceByPk(String pr_no) {
		return this.abcd.selectOne(namespace+"SelectResortPriceByPk", pr_no);
	}

	public int UpdateData(ResortPrice resortPrice) {
		return this.abcd.update(namespace+"UpdateData", resortPrice);
	}
	
	
}
