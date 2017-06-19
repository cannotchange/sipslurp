package com.sipslurp.daoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.sipslurp.dao.BaseDao;
import com.sipslurp.entity.BaseEntity;
import com.sipslurp.entity.User;
import com.sipslurp.models.UserInfo;

@SuppressWarnings("unchecked")
@Repository("baseDao")
public class BaseDaoImpl implements BaseDao {

	protected SessionFactory sessionFactory;
	protected HibernateTemplate hibernateTemplate;
	private static final Logger logger = Logger.getLogger(BaseDaoImpl.class);  
	

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void save(BaseEntity base) {
		hibernateTemplate.save(base);
	}

	@Override
	public void update(BaseEntity base) {
		hibernateTemplate.update(base);
	}

	@Override
	public void saveOrUpdate(BaseEntity base) {
		hibernateTemplate.saveOrUpdate(base);
	}
	
	@Override
	public BaseEntity findById(Long id, Class class1) {
		return (BaseEntity) hibernateTemplate.get(class1, id);
	}

	@Override
	public UserInfo checkLogin(UserInfo ui) {
		boolean res= false;
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(User.class);
		ct.add(Restrictions.eq("username", ui.getUsername().trim()));
		ct.add(Restrictions.eq("password", ui.getPassword().trim()));
		List<User>list = ct.list();
		if(list!=null && list.size()>0)
		{
			ui.setUserId(list.get(0).getUserId());
			ui.setResult(true);
		}else{
			ui.setResult(false);
		}
		return ui;
	}	
	
}
