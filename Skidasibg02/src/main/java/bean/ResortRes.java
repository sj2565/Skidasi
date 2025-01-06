package bean;

public class ResortRes {
	private String res_no;
	private String res_date;
	private String res_state;
	private String res_amount;
	private String member_id;
	private String pr_no;
	private String resort_no;
	private String resort_name;
	private String pr_hour;
	private String pr_price;
	private String pr_aorc;
	private String name;
	private String resort_img;

	@Override
	public String toString() {
		return "ResortRes [res_no=" + res_no + ", res_date=" + res_date + ", res_state=" + res_state + ", res_amount="
				+ res_amount + ", member_id=" + member_id + ", pr_no=" + pr_no + ", resort_no=" + resort_no
				+ ", resort_name=" + resort_name + ", pr_hour=" + pr_hour + ", pr_price=" + pr_price + ", pr_aorc="
				+ pr_aorc + ", name=" + name + ", resort_img=" + resort_img + "]";
	}
	public String getResort_img() {
		return resort_img;
	}
	public void setResort_img(String resort_img) {
		this.resort_img = resort_img;
	}
	public String getResort_no() {
		return resort_no;
	}
	public void setResort_no(String resort_no) {
		this.resort_no = resort_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPr_hour() {
		return pr_hour;
	}
	public void setPr_hour(String pr_hour) {
		this.pr_hour = pr_hour;
	}
	public String getPr_price() {
		return pr_price;
	}
	public void setPr_price(String pr_price) {
		this.pr_price = pr_price;
	}
	public String getPr_aorc() {
		return pr_aorc;
	}
	public void setPr_aorc(String pr_aorc) {
		this.pr_aorc = pr_aorc;
	}
	public String getRes_no() {
		return res_no;
	}
	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	public String getRes_amount() {
		return res_amount;
	}
	public void setRes_amount(String res_amount) {
		this.res_amount = res_amount;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPr_no() {
		return pr_no;
	}
	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}
	public String getResort_name() {
		return resort_name;
	}
	public void setResort_name(String resort_name) {
		this.resort_name = resort_name;
	}
}
