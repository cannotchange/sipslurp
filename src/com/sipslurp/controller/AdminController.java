package com.sipslurp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sipslurp.entity.User;
import com.sipslurp.models.InfoModal;
import com.sipslurp.models.ItemsInfo;
import com.sipslurp.models.PrintData;
import com.sipslurp.models.UserInfo;
import com.sipslurp.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired private AdminService adminService;
	private static final Logger logger = Logger.getLogger(AdminController.class); 
	
	@RequestMapping(value="/saveItems.htm",method=RequestMethod.POST)
	public @ResponseBody ItemsInfo getUerIpSessions(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		ItemsInfo ii= new ItemsInfo ();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.createNewItems(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/totalItems.htm",method=RequestMethod.GET)
	public @ResponseBody ItemsInfo totalItems(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to get total items");
		ItemsInfo ii= new ItemsInfo ();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			logger.info("user not null");
			ii = adminService.getTotalItems(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/createBill.htm",method=RequestMethod.GET)
	public ModelAndView showBillingPage(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("place order");
		ModelAndView mav = new ModelAndView("/admin/createBill");
		
		
		return mav;
	}
	
	@RequestMapping(value="/getItemNameByitemCode.htm",method=RequestMethod.POST)
	public @ResponseBody ItemsInfo getItemNameByitemCode(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("got code = "+i.getValue());
		ItemsInfo ii= new ItemsInfo ();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			logger.info("user not null");
			ii = adminService.getItemNameByItemCode(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/getItemNameFromSearch.htm",method=RequestMethod.POST)
	public @ResponseBody List<ItemsInfo> getItemNameFromSearch(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("got name = "+i.getValue());
		List<ItemsInfo> li = new ArrayList<>();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			logger.info("user not null");
			li = adminService.getItemNameFromSearch(i,u);
			logger.info("list size="+li.size());
		}
		
		return li;
	}
	
	@RequestMapping(value="/getItemPriceById.htm",method=RequestMethod.POST)
	public @ResponseBody ItemsInfo getItemPriceById(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("got code = "+i.getItemId());
		ItemsInfo ii= new ItemsInfo ();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			logger.info("user not null");
			ii = adminService.getItemPriceById(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/getItemsToPrint.htm",method=RequestMethod.POST)
	public @ResponseBody ItemsInfo getItemsToPrint(@RequestBody PrintData list,HttpServletRequest req){
		User u = (User)req.getSession().getAttribute("user");
		logger.info("list size = "+list.getList().size()); 
		ItemsInfo i = adminService.print(list,u);
		
		return i;
	}
	
	@RequestMapping(value="/userDetails.htm",method=RequestMethod.GET)
	public @ResponseBody UserInfo userDetails(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to get total items");
		UserInfo ii= new UserInfo();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.getUserDetails(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/orderInvoiceDetails.htm",method=RequestMethod.GET)
	public @ResponseBody UserInfo orderInvoiceDetails(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to get total items");
		UserInfo ii= new UserInfo();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.orderInvoiceDetails(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/getSelectoption.htm",method=RequestMethod.GET)
	public @ResponseBody List<UserInfo> getSelectoption(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to get list for bill type selection");
		List<UserInfo> ii= new ArrayList<UserInfo>();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.getSelectoption(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/createTable.htm",method=RequestMethod.POST)
	public @ResponseBody InfoModal createTable(@ModelAttribute InfoModal i,HttpServletRequest req){
		logger.info("to create table");
		InfoModal inf = new InfoModal();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			inf = adminService.createTable(i,u);
		}
		
		return inf;
	}
	
	@RequestMapping(value="/deleteTableItem.htm",method=RequestMethod.POST)
	public @ResponseBody InfoModal deleteTableItem(@ModelAttribute InfoModal i,HttpServletRequest req){
		logger.info("to delete table ");
		InfoModal inf = new InfoModal();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			inf = adminService.deleteTable(i,u);
		}
		
		return inf;
	}
	
	@RequestMapping(value="/publishTable.htm",method=RequestMethod.POST)
	public @ResponseBody InfoModal publishTable(@ModelAttribute InfoModal i,HttpServletRequest req){
		logger.info("to delete table ");
		InfoModal inf = new InfoModal();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			inf = adminService.publishTable(i,u);
		}
		
		return inf;
	}

	@RequestMapping(value="/getAllItems.htm",method=RequestMethod.GET)
	public @ResponseBody List<ItemsInfo> getAllItems(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to get list for bill type selection");
		List<ItemsInfo> ii= new ArrayList<ItemsInfo>();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.getAllItems(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/saveTableOrders.htm",method=RequestMethod.POST)
	public @ResponseBody PrintData saveTableOrders(@RequestBody PrintData list,HttpServletRequest req){
		User u = (User)req.getSession().getAttribute("user");
		 list = adminService.saveTempTableDetails(list,u);
		
		return list;
	}
	
	@RequestMapping(value="/clearBill.htm",method=RequestMethod.POST)
	public @ResponseBody ItemsInfo clearBill(@ModelAttribute InfoModal i,HttpServletRequest req){
		ItemsInfo ii= new ItemsInfo();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			ii = adminService.clearBill(i,u);
		}
		
		return ii;
	}
	
	@RequestMapping(value="/deleteItem.htm",method=RequestMethod.POST)
	public @ResponseBody InfoModal deleteItem(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("to delete table ");
		InfoModal inf = new InfoModal();
		User u = (User)req.getSession().getAttribute("user");
		if(u!=null){
			inf = adminService.deleteItem(i,u);
		}
		
		return inf;
	}
	
}
