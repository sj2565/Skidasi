package bean;

import org.hibernate.validator.constraints.Length;

public class Board {
	private int noticode;
	@Length(min=3, max=1000, message="제목은 3글자 이상 10글자 이하이어야 합니다.")
	private String notititle;
	@Length(min=4, max=30000, message="글 내용은 5자리 이상 30자리 이하이어야 합니다.")
	private String noticont;
	private String notidate;
	public int getNoticode() {
		return noticode;
	}
	public void setNoticode(int noticode) {
		this.noticode = noticode;
	}
	public String getNotititle() {
		return notititle;
	}
	public void setNotititle(String notititle) {
		this.notititle = notititle;
	}
	public String getNoticont() {
		return noticont;
	}
	public void setNoticont(String noticont) {
		this.noticont = noticont;
	}
	public String getNotidate() {
		return notidate;
	}
	public void setNotidate(String notidate) {
		this.notidate = notidate;
	}
	@Override
	public String toString() {
		return "Board [noticode=" + noticode + ", notititle=" + notititle + ", noticont=" + noticont + ", notidate="
				+ notidate + "]";
	}
	
}
