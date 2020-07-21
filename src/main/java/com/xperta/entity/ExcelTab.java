package com.xperta.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="exceltable")
public class ExcelTab {
	
	@Id
	private Long id;
	private String name;
	private String temperature;
	private String minTemp;
	private String maxTemp;
	private String humidity;
	private String pressure;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getMinTemp() {
		return minTemp;
	}
	public void setMinTemp(String minTemp) {
		this.minTemp = minTemp;
	}
	public String getMaxTemp() {
		return maxTemp;
	}
	public void setMaxTemp(String maxTemp) {
		this.maxTemp = maxTemp;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getPressure() {
		return pressure;
	}
	public void setPressure(String pressure) {
		this.pressure = pressure;
	}
	@Override
	public String toString() {
		return "ExcelTab [id=" + id + ", name=" + name + ", temperature=" + temperature + ", minTemp=" + minTemp
				+ ", maxTemp=" + maxTemp + ", humidity=" + humidity + ", pressure=" + pressure + "]";
	}
	
	
	
	

}
