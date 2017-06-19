package com.sipslurp.models;

import java.util.List;

public class PrintData {
	
	private String invoiceId;
	private String tableId;
	private String orderId;
	private String mobile;
	private String discount;
	private String resultTableId;
	private boolean result;
	private String totAmount;

	private List<ItemsInfo>list;

	public List<ItemsInfo> getList() {
		return list;
	}

	public void setList(List<ItemsInfo> list) {
		this.list = list;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getResultTableId() {
		return resultTableId;
	}

	public void setResultTableId(String resultTableId) {
		this.resultTableId = resultTableId;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getTotAmount() {
		return totAmount;
	}

	public void setTotAmount(String totAmount) {
		this.totAmount = totAmount;
	}
	
	 
}
