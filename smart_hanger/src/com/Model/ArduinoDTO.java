package com.Model;

public class ArduinoDTO {
	
	private String cloth_num;
	private String state;
	
	public ArduinoDTO(String cloth_num, String state) {
		super();
		this.cloth_num = cloth_num;
		this.state = state;
	}

	public String getCloth_num() {
		return cloth_num;
	}

	public String getState() {
		return state;
	}
	
	
	

}
