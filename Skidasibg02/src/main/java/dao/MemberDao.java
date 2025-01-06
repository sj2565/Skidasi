package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Member;

@Component("mdao")
public class MemberDao {
	private final String namespace = "MapperMember.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MemberDao() {}
	
	public Member SelectData(String member_id, String password) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("member_id", member_id);
		map.put("password", password);
		return this.abcd.selectOne(namespace+"SelectData", map);
	}

	public Member SelectDataByPk(String member_id) {
		return this.abcd.selectOne(namespace+"SelectDataByPk", member_id);
	}

	public int InsertData(Member bean) {
	
		return this.abcd.insert(namespace+"InsertData",bean);
	}

	public int DeleteData(Member bean) {
		return this.abcd.delete(namespace+"DeleteData",bean);
	}

	public int UpdateData(Member bean) {
		return this.abcd.update(namespace+"UpdateData", bean);
	}

	public int SelectTotalCount() {
		return this.abcd.selectOne(namespace + "SelectTotalCount");
	}

	public List<Member> SelectDataList(int offset, int limit) {
		// RowBounds 객체를 사용한 페이징 처리입니다.
		RowBounds rbs = new RowBounds(offset, limit) ;
		return this.abcd.selectList(namespace + "SelectDataList", null, rbs);	
	}


}
