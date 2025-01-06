package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.ResortInfo;

@Component("rdao")
public class ResortInfoDao {
private final String namespace = "MapperResort.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	// 저장
	public int InsertData(ResortInfo bean) {
		return this.abcd.insert(namespace+"InsertData", bean);
	}

	// 리스트 조회
	public List<ResortInfo> SelectData() {
		return this.abcd.selectList(namespace+"SelectData");
	}

	//ID이용하여 조회 
	public ResortInfo SelectDataByPk(String id) {
		ResortInfo resort = this.abcd.selectOne(namespace+"SelectDataByPk",id);
		return resort;
	}

	// 정보 수정
	public int UpdateData(ResortInfo bean) {
		return this.abcd.update(namespace+"UpdateData", bean);
		
	}

	// 정보 삭제
	public int DeleteData(ResortInfo bean) {
		return this.abcd.delete(namespace+"DeleteData",bean);
	}
}
