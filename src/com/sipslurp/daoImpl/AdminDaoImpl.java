package com.sipslurp.daoImpl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.sipslurp.dao.AdminDao;
import com.sipslurp.entity.Items;
import com.sipslurp.entity.Tables;
import com.sipslurp.entity.TempTableData;
import com.sipslurp.entity.User;
import com.sipslurp.extras.StatusClass;
import com.sipslurp.models.InfoModal;
import com.sipslurp.models.ItemsInfo;
import com.sipslurp.models.UserInfo;

@SuppressWarnings("unchecked")
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

	protected SessionFactory sessionFactory;
	protected HibernateTemplate hibernateTemplate;
	private static final Logger logger = Logger.getLogger(AdminDaoImpl.class);  
	

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
		this.sessionFactory = sessionFactory;
	}


	@Override
	public boolean isItemPresent(ItemsInfo i, User u) {
		boolean result = false;
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Items.class);
		ct.add(Restrictions.eq("itemName", i.getItemName().trim()).ignoreCase());
		List<Items>li = ct.list();
		if(li!=null && li.size()>0){
			result=true;
		}
		return result;
	}


	@Override
	public int getTotalItems(User u) {
		int total=0;
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Items.class);
		List<Items>li = ct.list();
		if(li!=null && li.size()>0){
			total = li.size();
		}
		return total;
	}


	@Override
	public ItemsInfo getItemNameByItemCode(ItemsInfo i, User u) {
		try{
			Criteria ct = sessionFactory.getCurrentSession().createCriteria(Items.class);
			ct.add(Restrictions.eq("id", Long.parseLong(i.getValue())));
			List<Items>li = ct.list();
			logger.info("list size = "+li.size());
			if(li!=null && li.size()>0){
				i.setItemName(li.get(0).getItemName());
				i.setItemId(li.get(0).getId());
				i.setItemPrice(li.get(0).getItemPrice()+"");
				i.setResult(true);
			}else{
				i.setResult(false);
			}	
		}catch(Exception e){
			e.printStackTrace();
			i.setResult(false);
		}
		return i;
	}


	@Override
	public List<Items> getItemNameFromSearch(ItemsInfo i, User u) {
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Items.class);
		ct.add(Restrictions.like("itemName", "%"+i.getValue()+"%"));
		ct.addOrder(Order.asc("itemName"));
		List<Items>li = ct.list();
		return li;
	}


	@Override
	public List<Tables> getTables(ItemsInfo i, User u) {
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Tables.class);
		//ct.add(Restrictions.eq("user", u));
		ct.add(Restrictions.eq("deleteStatus", false));
		List<Tables> list = ct.list();
		return list;
	}


	@Override
	public boolean isTableAlreadyCreated(InfoModal i, User u) {
		boolean result= false;
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Tables.class);
		ct.add(Restrictions.like("tableName", i.getTableName()).ignoreCase());
		ct.add(Restrictions.eq("deleteStatus", false));
		//ct.add(Restrictions.eq("status", StatusClass.PUBLISHED));
		List<Tables> list = ct.list();
		if(list!=null && list.size()>0){
			result = true;
		}
		return result;
	}


	@Override
	public List<Items> getAllItems(ItemsInfo i, User u) {
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(Items.class);
		ct.add(Restrictions.eq("deleteStatus", false));
		ct.addOrder(Order.asc("itemName"));
		List<Items>list = ct.list();
		return list;
	}


	@Override
	public boolean deleteTempDetails(Tables tab) {
		boolean result =false;
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(TempTableData.class);
		ct.add(Restrictions.eq("table", tab));
		ct.add(Restrictions.eq("deleteStatus", false));
		List<TempTableData>list = ct.list();
		try{
			if(list!=null && list.size()>0){
				for (TempTableData tempTableData : list) {
					sessionFactory.getCurrentSession().delete(tempTableData);
				}
				
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
			result =false;
		}
		
		return result;
	}


	@Override
	public List<TempTableData> getTempData(Tables tab) {
		Criteria ct = sessionFactory.getCurrentSession().createCriteria(TempTableData.class);
		ct.add(Restrictions.eq("table", tab));
		ct.add(Restrictions.eq("deleteStatus", false));
		List<TempTableData>list = ct.list();
		return list;
	}
	
}
