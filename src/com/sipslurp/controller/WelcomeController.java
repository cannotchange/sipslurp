package com.sipslurp.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sipslurp.dao.BaseDao;
import com.sipslurp.entity.User;
import com.sipslurp.models.ItemsInfo;
import com.sipslurp.models.UserInfo;
import com.sipslurp.service.RegisterService;

@Controller
public class WelcomeController 
{
	private static Logger logger = Logger.getLogger(WelcomeController.class);
	@Autowired private RegisterService registerService;
	@Autowired private BaseDao baseDao;


	@RequestMapping(value={"/sessionOut.htm"})	
    public ModelAndView userSessionExpired(HttpSession session) {
		logger.info("@ method - userSessionExpired()");
		try {
			Enumeration<String> names = session.getAttributeNames();
			while (names.hasMoreElements()) {
				session.removeAttribute(names.nextElement());
			}
		} catch (Exception ex) {
			logger.error(ex);
		}
		session.invalidate();
	    ModelAndView mav = new ModelAndView("welcome");
		mav.addObject("error", "Your session has expired, login again");
        return mav;
    }
	
	
	@RequestMapping("/index.htm")
	public String WelcomePage() {
		logger.info("WelcomePage-login");
		return "login";
	}
	
	@RequestMapping("/login.htm")
	public String login(@ModelAttribute UserInfo ui,HttpServletRequest req) {
		User user =(User)req.getSession().getAttribute("user");
		if(user!=null){
			return "admin/dashboard";
		}else{
			 if(ui.getUsername()!=null && ui.getPassword()!=null){
				 ui = registerService.isLogin(ui);
					if(ui.isResult()){
						User u =(User)baseDao.findById(ui.getUserId(), User.class);
						req.getSession().setAttribute("user",u);
						return "admin/dashboard";}
					else{
						return "login";}
					}else{
						return "login";
					}
			}
		
	}

	@RequestMapping(value={"/logout.htm"})	
    public String logoutUser(HttpSession session) {
		logger.info("@ method - logoutUser()");
		try {
			Enumeration<String> names = session.getAttributeNames();
			while (names.hasMoreElements()) {
				session.removeAttribute(names.nextElement());
			}
		} catch (Exception ex) {
			logger.error(ex);
		}
		session.invalidate();
        return "login";
    }
	
	@RequestMapping(value="/createBills.htm",method=RequestMethod.GET)
	public ModelAndView showBillingPage(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("place order");
		ModelAndView mav = new ModelAndView("/admin/createBill");
		
		
		return mav;
	}
	
	@RequestMapping(value="/tableManagement.htm",method=RequestMethod.GET)
	public ModelAndView tableManagemet(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("place order");
		ModelAndView mav = new ModelAndView("/admin/tableManagement");
		
		
		return mav;
	}
	
	@RequestMapping(value="/itemManagement.htm",method=RequestMethod.GET)
	public ModelAndView itemManagement(@ModelAttribute ItemsInfo i,HttpServletRequest req){
		logger.info("place order");
		ModelAndView mav = new ModelAndView("/admin/itemManagement");
		
		
		return mav;
	}
}
