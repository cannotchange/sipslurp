package com.sipslurp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="users", uniqueConstraints=@UniqueConstraint(columnNames="username") )
public class User extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private long userId;

	@Column(name="type",length=15)
	private String usertype;

	@Column(name="password",length=45)
	private String password;

	@Column(name="fullname",length=100)
	private String fullname;

	@Column(name="username",unique=true,length=45)
	private String username;

	public User() {}
	public User(String username, String password, String type) {
		this.username = username;
		this.password = password;
	}

	@Override
	public String toString() {
		return "("+this.userId+", "+this.username+")";
	}

	public long getUserId() {
		return userId;
	}
	public String getUsertype() {
		return usertype;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
}
