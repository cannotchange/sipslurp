package com.sipslurp.dao;

import com.sipslurp.entity.BaseEntity;
import com.sipslurp.models.UserInfo;

public interface BaseDao {

	BaseEntity findById(Long id, Class class1);

	UserInfo checkLogin(UserInfo ui);

	void save(BaseEntity base);

	void update(BaseEntity base);

	void saveOrUpdate(BaseEntity base);

}
