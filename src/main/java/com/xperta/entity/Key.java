package com.xperta.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="key")
public class Key {
	@Id
	private Long id;
	
	private Long key;
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getKey() {
		return key;
	}

	public void setKey(long key) {
		this.key = key;
	}
	
	
	

}
