package com.yusufkolcuk.excel;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WeatherForecast")
public class WeatherForecast {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int WeatherId;
	private String City;
	private int MaximumWF;
	private int MinimumWF;
	public int getWeatherId() {
		return WeatherId;
	}
	public void setWeatherId(int weatherId) {
		WeatherId = weatherId;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public int getMaximumWF() {
		return MaximumWF;
	}
	public void setMaximumWF(int maximumWF) {
		MaximumWF = maximumWF;
	}
	public int getMinimumWF() {
		return MinimumWF;
	}
	public void setMinimumWF(int minimumWF) {
		MinimumWF = minimumWF;
	}
	

}
