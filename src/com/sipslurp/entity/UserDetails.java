package com.sipslurp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="employee")
public class UserDetails extends BaseEntity {

	private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name="employee_Id", nullable = false)
	private int employee_Id;
    
    @Column(name="fname", nullable = false)
	private String fname;
    
    @Column(name="lname", length=100, columnDefinition="lname NOT NULL")
	private String lname;
    
    @Column(name="date",columnDefinition="date NOT NULL")
	private String date;
    
    @Column(name="designation", length=50, columnDefinition="designation NOT NULL")
	private String designation;
    
    @Column(name="location", columnDefinition="location NOT NULL")
	private String location;
    
	public int getEmployee_Id() {
		return employee_Id;
	}
	public void setEmployee_Id(int employee_Id) {
		this.employee_Id = employee_Id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getdate() {
		return date;
	}
	public void setdate(String date) {
		this.date= date;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
    
}
