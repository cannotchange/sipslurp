package com.sipslurp.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sipslurp.dao.BaseDao;
import com.sipslurp.models.UserInfo;
import com.sipslurp.service.RegisterService;

@Service("registerService")
@Transactional(propagation = Propagation.SUPPORTS)
public class RegisterServiceImpl implements RegisterService {

	@Autowired private BaseDao baseDao;
	@Override
	public UserInfo isLogin(UserInfo ui) {
		ui = baseDao.checkLogin(ui);
		return ui;
	}
	

}
