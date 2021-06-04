package com.Model;

public class ServiceDTO {

	
  private String service_num;
  private String userid;
  private String title;
  private String content;
  private String upload_date;
  
public ServiceDTO(String service_num, String userid, String title, String content, String upload_date) {

	this.service_num = service_num;
	this.userid = userid;
	this.title = title;
	this.content = content;
	this.upload_date = upload_date;
}



public ServiceDTO(String userid, String title, String content) {
	this.userid = userid;
	this.title = title;
	this.content = content;
}



public String getService_num() {
	return service_num;
}

public void setService_num(String service_num) {
	this.service_num = service_num;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getUpload_date() {
	return upload_date;
}

public void setUpload_date(String upload_date) {
	this.upload_date = upload_date;
}
  
  
	
	
}
