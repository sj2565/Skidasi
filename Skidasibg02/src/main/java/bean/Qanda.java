package bean;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Qanda {
	private int qnacode;
	@Length(min=3, max=1000, message="제목은 3글자 이상 10글자 이하이어야 합니다.")
	private String qnatitle;
	@Length(min=4, max=10, message="비밀 번호는 4자리 이상 10자리 이하이어야 합니다.")
	private String qnapaw;
	private String qnawdate;
	@Length(min=4, max=30000, message="글 내용은 5자리 이상 30자리 이하이어야 합니다.")
	private String qnacont;
	private int qnahit;
	@NotEmpty(message= "비고를 넣어주세요 " )
	private String qna_remark;
	private int qna_groupno;
	private int qna_orderno;
	private int qna_depth;
	private String member_id;
	public int getQnacode() {
		return qnacode;
	}
	public void setQnacode(int qnacode) {
		this.qnacode = qnacode;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnapaw() {
		return qnapaw;
	}
	public void setQnapaw(String qnapaw) {
		this.qnapaw = qnapaw;
	}
	public String getQnawdate() {
		return qnawdate;
	}
	public void setQnawdate(String qnawdate) {
		this.qnawdate = qnawdate;
	}
	public String getQnacont() {
		return qnacont;
	}
	public void setQnacont(String qnacont) {
		this.qnacont = qnacont;
	}
	public int getQnahit() {
		return qnahit;
	}
	public void setQnahit(int qnahit) {
		this.qnahit = qnahit;
	}
	public String getQna_remark() {
		return qna_remark;
	}
	public void setQna_remark(String qna_remark) {
		this.qna_remark = qna_remark;
	}
	public int getQna_groupno() {
		return qna_groupno;
	}
	public void setQna_groupno(int qna_groupno) {
		this.qna_groupno = qna_groupno;
	}
	public int getQna_orderno() {
		return qna_orderno;
	}
	public void setQna_orderno(int qna_orderno) {
		this.qna_orderno = qna_orderno;
	}
	public int getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(int qna_depth) {
		this.qna_depth = qna_depth;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Qanda [qnacode=" + qnacode + ", qnatitle=" + qnatitle + ", qnapaw=" + qnapaw + ", qnawdate=" + qnawdate
				+ ", qnacont=" + qnacont + ", qnahit=" + qnahit + ", qna_remark=" + qna_remark + ", qna_groupno="
				+ qna_groupno + ", qna_orderno=" + qna_orderno + ", qna_depth=" + qna_depth + ", member_id=" + member_id
				+ "]";
	}
	
}
