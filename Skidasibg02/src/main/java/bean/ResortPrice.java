package bean;

import org.hibernate.validator.constraints.NotEmpty;

public class ResortPrice {
	private String pr_no;
	@NotEmpty(message = "시간이 선택되지 않았습니다.")
	private String pr_hour;
	@NotEmpty(message = "성인/소인을 선택하세요.")
	private String pr_aorc;
	@NotEmpty(message = "가격을 입력하세요.")
	private String pr_price;
	private String resort_no;
	private String resort_name;
	private String resort_img;
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getPr_hour() {
		return pr_hour;
	}
	public void setPr_hour(String pr_hour) {
		this.pr_hour = pr_hour;
	}
	public String getPr_aorc() {
		return pr_aorc;
	}
	public void setPr_aorc(String pr_aorc) {
		this.pr_aorc = pr_aorc;
	}
	public String getPr_price() {
		return pr_price;
	}
	public void setPr_price(String pr_price) {
		this.pr_price = pr_price;
	}
	public String getResort_no() {
		return resort_no;
	}
	public void setResort_no(String resort_no) {
		this.resort_no = resort_no;
	}
	public String getResort_name() {
		return resort_name;
	}
	public void setResort_name(String resort_name) {
		this.resort_name = resort_name;
	}
	public String getResort_img() {
		return resort_img;
	}
	public void setResort_img(String resort_img) {
		this.resort_img = resort_img;
	}
	@Override
	public String toString() {
		return "ResortPrice [pr_no=" + pr_no + ", pr_hour=" + pr_hour + ", pr_aorc=" + pr_aorc + ", pr_price="
				+ pr_price + ", resort_no=" + resort_no + ", resort_name=" + resort_name + ", resort_img=" + resort_img
				+ "]";
	}
	
	
}
