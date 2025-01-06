package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bean.Board;

@Component("bdao")
public class BoardDao {
	private final String namespace = "MapperBoard.";
	
	@Autowired
	SqlSessionTemplate abcd;
	//글 수 세기
	public int SelectTotalCount(String mode, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("mode", mode);
		map.put("keyword", keyword);
		return this.abcd.selectOne(namespace+"SelectTotalCount",map);
	}

	// 글 목록 
	public List<Board> SelectDataList(int offset, int limit, String mode, String keyword) {
		// 랭킹을 이용하여 해당 페이지의 데이터를 컬렉션으로 반환합니다.
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode) ;
		map.put("keyword", "%" + keyword + "%") ;
		return this.abcd.selectList(namespace+"SelectDataList",map, rowBounds);
	}

	// 글 쓰기 
	public int InsertData(Board bean) {
		
		return this.abcd.insert(namespace+"InsertData", bean);
	}

	// 글번호로 글 가져오기
	public Board SelectDataByPk(int no) {
		return this.abcd.selectOne(namespace+"SelectDataByPk", no);
	}

	// 글 수정하기
	public int UpdateData(Board bean) {
		return this.abcd.update(namespace+"UpdateData", bean );
	}

	// 글 삭제하기
	public int DeleteData(int no) {
		return this.abcd.delete(namespace+"DeleteData", no);
	}

}
