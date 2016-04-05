
package com.spring;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public  class disease 
{
    private long serialVersionUID = 1;
    @PrimaryKey
    @Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
    private String key;
    
    @Persistent
    private String useremail;
    
    @Persistent
    private String cropcultivated;
    
    @Persistent
    private String location;
    
    @Persistent
    private String state;
    
    @Persistent
    private String zipcode;
    
    @Persistent
    private String soiltype;
    
    @Persistent
    private String acrescount;
    
    @Persistent
    private String disease;
    
    @Persistent
    private String duration;
    
    @Persistent
    private String currency;
    
    @Persistent
    private String loss;
    
    @Persistent
    private String pesticide;
    
    @Persistent
    private String reason;
    
    @Persistent
    private String date;

	
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

	public String getCropcultivated() {
		return cropcultivated;
	}

	public void setCropcultivated(String cropcultivated) {
		this.cropcultivated = cropcultivated;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSoiltype() {
		return soiltype;
	}

	public void setSoiltype(String soiltype) {
		this.soiltype = soiltype;
	}

	public String getAcrescount() {
		return acrescount;
	}

	public void setAcrescount(String acrescount) {
		this.acrescount = acrescount;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getLoss() {
		return loss;
	}

	public void setLoss(String loss) {
		this.loss = loss;
	}

	public String getPesticide() {
		return pesticide;
	}

	public void setPesticide(String pesticide) {
		this.pesticide = pesticide;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	}
