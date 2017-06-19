package com.sipslurp.dao;

import java.util.List;

import com.sipslurp.entity.Items;
import com.sipslurp.entity.Tables;
import com.sipslurp.entity.TempTableData;
import com.sipslurp.entity.User;
import com.sipslurp.models.InfoModal;
import com.sipslurp.models.ItemsInfo;

public interface AdminDao {

	boolean isItemPresent(ItemsInfo i, User u);

	int getTotalItems(User u);

	ItemsInfo getItemNameByItemCode(ItemsInfo i, User u);

	List<Items> getItemNameFromSearch(ItemsInfo i, User u);

	List<Tables> getTables(ItemsInfo i, User u);

	boolean isTableAlreadyCreated(InfoModal i, User u);

	List<Items> getAllItems(ItemsInfo i, User u);

	boolean deleteTempDetails(Tables tab);

	List<TempTableData> getTempData(Tables tab);

}
