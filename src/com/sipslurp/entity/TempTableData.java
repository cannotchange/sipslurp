package com.sipslurp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="temp_bill_data")
public class TempTableData extends BaseEntity{


	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="temp_id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="table_id")
	private Tables table;
	
	@Column(name="invoice_type")
	private String invoiceType;
	
	@Column(name="discount")
	private double discount;
	
	@Column(name="total_price")
	private double billPrice;
	
	@ManyToOne
	@JoinColumn(name="item_code")
	private Items itemCode;
	
	@Column(name="item_quantity")
	private int itemQuantity;
	
	@Column(name="mobile")
	private int mobile;
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public Tables getTable() {
		return table;
	}
	
	public void setTable(Tables table) {
		this.table = table;
	}
	
	public String getInvoiceType() {
		return invoiceType;
	}
	
	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}
	
	public double getDiscount() {
		return discount;
	}
	
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	public double getBillPrice() {
		return billPrice;
	}
	
	public void setBillPrice(double billPrice) {
		this.billPrice = billPrice;
	}
	
	public Items getItemCode() {
		return itemCode;
	}
	
	public void setItemCode(Items itemCode) {
		this.itemCode = itemCode;
	}
	
	public int getItemQuantity() {
		return itemQuantity;
	}
	
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	
	public int getMobile() {
		return mobile;
	}
	
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	
	//Object {list: Array(1), mobile: "99999999", orderId: 0, tableId: "5", discount: "10"}
	/*itemCode:"4"
	  itemPrice:"200"
	  itemQuantity:"2"*/
	
	
	
}
