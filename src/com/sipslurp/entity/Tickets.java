package com.sipslurp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tickets")
public class Tickets extends BaseEntity 
{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;

	@Column(name="count",columnDefinition="bigint(20) NOT NULL default 100 ",nullable=false)
	private long count = 100;

	@Column(name="start",columnDefinition="date NOT NULL",nullable=false)
	private String start;

	@Column(name="end",columnDefinition="date")
	private String end;

	public Tickets() {}
	public Tickets(String date) {
		this.start = date;
	}

	@Override
	public String toString() {
		return "( "+this.start+", "+this.count+" )";
	}

	public long getId() {
		return id;
	}
	public long getCount() {
		return count;
	}
	public String getEnd() {
		return end;
	}
	public String getStart() {
		return start;
	}
	public void setId(long id) {
		this.id = id;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
