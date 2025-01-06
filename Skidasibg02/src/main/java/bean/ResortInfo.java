package bean;

import org.springframework.web.multipart.MultipartFile;

public class ResortInfo {
	private int resort_no;
	private String resort_area;
	private String resort_name;
	private String resort_tel;
	private String resort_addr;
	private String resort_cont;
	private String resort_img;
	private MultipartFile imgfile;
	
	public MultipartFile getImgfile() {
		return imgfile;
	}
	public void setImgfile(MultipartFile imgfile) {
		this.imgfile = imgfile;
		
		if(this.imgfile != null) {
			this.resort_img = this.imgfile.getOriginalFilename();
		}
	}
	public int getResort_no() {
		return resort_no;
	}
	public void setResort_no(int resort_no) {
		this.resort_no = resort_no;
	}
	public String getResort_area() {
		return resort_area;
	}
	public void setResort_area(String resort_area) {
		this.resort_area = resort_area;
	}
	public String getResort_name() {
		return resort_name;
	}
	public void setResort_name(String resort_name) {
		this.resort_name = resort_name;
	}
	public String getResort_tel() {
		return resort_tel;
	}
	public void setResort_tel(String resort_tel) {
		this.resort_tel = resort_tel;
	}
	public String getResort_addr() {
		return resort_addr;
	}
	public void setResort_addr(String resort_addr) {
		this.resort_addr = resort_addr;
	}
	public String getResort_cont() {
		return resort_cont;
	}
	public void setResort_cont(String resort_cont) {
		this.resort_cont = resort_cont;
	}
	public String getResort_img() {
		return resort_img;
	}
	public void setResort_img(String resort_img) {
		this.resort_img = resort_img;
	}
	@Override
	public String toString() {
		return "ResortInfo [resort_no=" + resort_no + ", resort_area=" + resort_area + ", resort_name=" + resort_name
				+ ", resort_tel=" + resort_tel + ", resort_addr=" + resort_addr + ", resort_cont=" + resort_cont
				+ ", resort_img=" + resort_img + "]";
	}
	
}
