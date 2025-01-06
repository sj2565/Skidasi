package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Qanda;

@Component("qdao")
public class QandaDao {
	private final String namespace = "MapperQanda.";
	
	@Autowired
	SqlSessionTemplate abcd;

	//Q&A 작성하기 
	public int InsertData(Qanda xxx) {
		return this.abcd.insert(namespace+"InsertData", xxx);
	}

	//Q&A 글 수 
	public int SelectTotalCount(String mode, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("mode", mode);
		map.put("keyword", keyword);
		return this.abcd.selectOne(namespace+"SelectTotalCount", map);
	}

	//Q&A목록 
	public List<Qanda> SelectDataList(int offset, int limit, String mode, String keyword) {
		RowBounds rowBounds = new RowBounds(offset,limit);
		Map<String,String> map = new HashMap<String,String>();
		map.put("mode", mode);
		map.put("keyword", "%"+keyword+"%");
		return this.abcd.selectList(namespace+"SelectDataList", map, rowBounds);
	}

	// Q&A 삭제하기 
	public int DeleteData(int no) {
		return this.abcd.delete(namespace+"DeleteData", no);
	}

	public Qanda SelectDataByPk(int no) {
		return this.abcd.selectOne(namespace+"SelectDataByPk", no);
	}

	//조회수 증가
	public int UpdateReadhit(int no) {
		return this.abcd.update(namespace+"UpdateReadhit", no);
	}

	// 답변달기
	public int ReplyData(Qanda bean) {
		// 동일한 groupno에 대한 수정 작업이 이루어 져야 합니다.
		// 넘어온 groupno와 동일하고, 넘어온 orderno 보다 큰 항목들에 대하여 
		// orderno를 +1증가시켜 줍니다.
		int groupno = bean.getQna_groupno();
		int orderno = bean.getQna_orderno();
		
		int cnt = -99999;
		
		// 제네릭 
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("qna_groupno", groupno);
		map.put("qna_orderno", orderno);
		
		cnt = this.abcd.update(namespace+"ReplyDataUpdate", map);
		System.out.println(cnt);
		
		// 신규 답글을 추가해 주어야 합니다.
		// 기본키는 시퀀스.nextval, 그룹번호는 넘겨진 그룹 번호를 그대로 사용
		// orderno와 depth는 각각 +1 
		bean.setQna_orderno(bean.getQna_orderno()+1);
		bean.setQna_depth(bean.getQna_depth() +1);
		return this.abcd.insert(namespace+"ReplyDataInsert",bean);
	}

	// 수정하기
	public int UpdateData(Qanda bean) {
		return this.abcd.update(namespace+"UpdateData", bean);
	}
	
}
