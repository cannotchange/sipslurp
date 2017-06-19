package com.sipslurp.service;

import java.util.List;

import com.sipslurp.entity.Tables;
import com.sipslurp.entity.User;
import com.sipslurp.models.InfoModal;
import com.sipslurp.models.ItemsInfo;
import com.sipslurp.models.PrintData;
import com.sipslurp.models.UserInfo;

public interface AdminService {

	public ItemsInfo createNewItems(ItemsInfo i, User u);

	public ItemsInfo getTotalItems(ItemsInfo i, User u);

	public ItemsInfo getItemNameByItemCode(ItemsInfo i, User u);

	public List<ItemsInfo> getItemNameFromSearch(ItemsInfo i, User u);

	public ItemsInfo getItemPriceById(ItemsInfo i, User u);

	ItemsInfo print(PrintData pd, User u);

	UserInfo getUserDetails(ItemsInfo i, User u);

	public UserInfo orderInvoiceDetails(ItemsInfo i, User u);

	public List<UserInfo> getSelectoption(ItemsInfo i, User u);

	public InfoModal createTable(InfoModal i, User u);

	public InfoModal deleteTable(InfoModal i, User u);

	public InfoModal publishTable(InfoModal i, User u);

	public List<ItemsInfo> getAllItems(ItemsInfo i, User u);

	public PrintData saveTempTableDetails(PrintData list, User u);

	public ItemsInfo clearBill(InfoModal i, User u);

	public InfoModal deleteItem(ItemsInfo i, User u);

}
