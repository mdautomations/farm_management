
package com.spring;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public  class farmdata {
    private static long serialVersionUID = 1;
    @PrimaryKey
    @Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
    private String key;
    
    @Persistent
    private String useremail;
    
    @Persistent
    private String fieldname;
    
    @Persistent
    private String location;
    
    @Persistent
    private String soiltype;
    
    @Persistent
    private String ownership;
    
    @Persistent
    private String totalarea;
    
    @Persistent
    private String climatetype;
    
    @Persistent
    private String weather;
    
    @Persistent
    private String pesticides;
    
    @Persistent
    private String fav_culti;
    
    @Persistent
    private String usernotes;
    
    @Persistent
    private String datetime;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		farmdata.serialVersionUID = serialVersionUID;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getFieldname() {
		return fieldname;
	}

	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSoiltype() {
		return soiltype;
	}

	public void setSoiltype(String soiltype) {
		this.soiltype = soiltype;
	}

	public String getOwnership() {
		return ownership;
	}

	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}

	public String getTotalarea() {
		return totalarea;
	}

	public void setTotalarea(String totalarea) {
		this.totalarea = totalarea;
	}

	public String getClimatetype() {
		return climatetype;
	}

	public void setClimatetype(String climatetype) {
		this.climatetype = climatetype;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getPesticides() {
		return pesticides;
	}

	public void setPesticides(String pesticides) {
		this.pesticides = pesticides;
	}

	public String getFav_culti() {
		return fav_culti;
	}

	public void setFav_culti(String fav_culti) {
		this.fav_culti = fav_culti;
	}

	public String getUsernotes() {
		return usernotes;
	}

	public void setUsernotes(String usernotes) {
		this.usernotes = usernotes;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
    
    
}