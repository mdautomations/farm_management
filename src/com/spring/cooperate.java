
package com.spring;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public  class cooperate {
    private static long serialVersionUID = 1;
    @PrimaryKey
    @Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
    private String key;
    
    @Persistent
    private String requestedby;
    
    @Persistent
    private Date date;
    
    @Persistent
    private String requestsentto;
    
    @Persistent
    private String status;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		cooperate.serialVersionUID = serialVersionUID;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getUseremail() {
		return requestedby;
	}

	public void setUseremail(String requestedby) {
		this.requestedby = requestedby;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRequestsentto() {
		return requestsentto;
	}

	public void setRequestsentto(String requestsentto) {
		this.requestsentto = requestsentto;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
    
}