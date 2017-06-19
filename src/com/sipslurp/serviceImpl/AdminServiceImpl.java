package com.sipslurp.serviceImpl;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sipslurp.dao.AdminDao;
import com.sipslurp.dao.BaseDao;
import com.sipslurp.entity.BillDetails;
import com.sipslurp.entity.Invoice;
import com.sipslurp.entity.Items;
import com.sipslurp.entity.Tables;
import com.sipslurp.entity.TempTableData;
import com.sipslurp.entity.User;
import com.sipslurp.extras.StatusClass;
import com.sipslurp.models.InfoModal;
import com.sipslurp.models.ItemsInfo;
import com.sipslurp.models.PrintData;
import com.sipslurp.models.UserInfo;
import com.sipslurp.service.AdminService;
import com.sipslurp.utils.PrinterService;
import com.sipslurp.utils.Test;

@Service("adminService")
@Transactional(propagation = Propagation.SUPPORTS)
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;
	@Autowired BaseDao baseDao;
	
	private static final Logger logger = Logger.getLogger(AdminServiceImpl.class);  
	
	@Override
	public ItemsInfo createNewItems(ItemsInfo i, User u) {
		logger.info("came to save new item");
		boolean result = adminDao.isItemPresent(i,u);
		logger.info("item name == "+i.getItemName());
		logger.info("item price == "+i.getItemPrice());
		logger.info("item type= "+i.getItemType());
		if(!result){
			//save item
			try{
				Items item = new Items();
				item.setItemName(i.getItemName().trim());
				item.setItemPrice(Double.parseDouble(i.getItemPrice()));
				item.setItemType(i.getItemType());
				item.setCreated(new Timestamp(new Date().getTime()));
				if(u!=null)
				item.setUser(u);
				i.setResult(true);
				baseDao.save(item);
			}catch(Exception e){
				e.printStackTrace();
				i.setResult(false);
			}
			
		}
		return i;
	}

	@Override
	public ItemsInfo getTotalItems(ItemsInfo i, User u) {
		int total = adminDao.getTotalItems(u);
		i.setTotalItems(total);
		return i;
	}

	@Override
	public ItemsInfo getItemNameByItemCode(ItemsInfo i, User u) {
		adminDao.getItemNameByItemCode(i,u);
		return i;
	}

	@Override
	public List<ItemsInfo> getItemNameFromSearch(ItemsInfo i, User u) {
		List<Items> list = adminDao.getItemNameFromSearch(i,u);
		List<ItemsInfo> li = new ArrayList(); 
		if(list!=null && list.size()>0){
			for (Items itm : list) {
				ItemsInfo it = new ItemsInfo();
				it.setItemId(itm.getId());
				it.setItemName(itm.getItemName());
				li.add(it);
			}
		}
		return li;
	}

	@Override
	public ItemsInfo getItemPriceById(ItemsInfo i, User u) {
		Items item = (Items)baseDao.findById(i.getItemId(), Items.class);
		if(item!=null){
			i.setResult(true);
			i.setItemPrice(item.getItemPrice()+"");
		}
		return i;
	}
	
	@Override
	public ItemsInfo print(PrintData pd,User user){
		ItemsInfo i = new ItemsInfo();
		//save details
		List<ItemsInfo>itmInfo = pd.getList();
		saveBillDetails(pd,user);
		try{
			printThisBill(pd);
			i.setResult(true);
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	

	/*public void printThisBill(PrintData print)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat(",yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String str = date.toString().substring(0, 3);
	    double tot=0;
		String name =     "";
	    String qty =      "";
	    String rate =     "";
	    String amount =   "";
	    String header ="\n;\n" 
	    		+"\n;\n"
	    		+"\n;\n"
	    		+"     Table Id- "+print.getTableId()+";\n"//add order no
				 +"     Order Id- "+print.getInvoiceId()+";\n"//add order no
		          +"     ***********************-Sip N Slurp-*********************** ;\n"
		          + "     Date:"+(str+dateFormat.format(date))+"   ;\n"
		          + "     --------------------------------------------------------- ;\n"
		          + "     Name                              Qty            Rate            Amt;\n"//name space 30,
		          + "     --------------------------------------------------------- ;\n";

		    

		String bill = header;
		List<ItemsInfo>itmInfo = print.getList();
		for (ItemsInfo ii : itmInfo) {
			Items i = (Items)baseDao.findById(Long.parseLong(ii.getItemCode()), Items.class);
			name = i.getItemName();
			if(name.length()>10){
				name = name.substring(0, 9)+".";
			}else if(name.length()<=30){
				//name = name+"    ";
				name= Test.fixedLengthString(name, 35);
			}else{
				name = name.substring(0, 35)+".";
			}
			qty = ii.getItemQuantity();
			amount = i.getItemPrice() * Double.parseDouble(ii.getItemQuantity())+"";
			tot+=i.getItemPrice() * Double.parseDouble(ii.getItemQuantity());
			rate = i.getItemPrice()+"";
			String items ="     "+name+""+qty+"          "+rate+"          "+amount+";\n";//name not more than 10
			System.out.println(items);

			bill = bill+ items;
		}
		String amt = "     --------------------------------------------------------- ;\n"
		          +"     Total Amount = Rs. "+print.getTotAmount()+";\n"
		          + "     Tax = NA;\n"
		          + "     ******************************************************** ;\n"
		          + "     Thank you. ;\n"
		          + "     Visit Us Again ;\n";
	   bill = bill+amt;
	   System.out.println(bill);
	   new PrinterService().printString("Local Printer",bill);
	 //  printCard(bill);
	}*/
	//////////
	
	
	public void printThisBill(PrintData print)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat(",yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String str = date.toString().substring(0, 3);
	    double tot=0;
		String name =     "";
	    String qty =      "";
	    String rate =     "";
	    String amount =   "";
	    String header ="\n"
	    		+"  Bill- "+print.getTableId()+"\n"//add order no
				 +"  Order Id- "+print.getInvoiceId()+"\n"//add order no
		          +"  *************-Sip N Slurp-************** \n"
		          + "  Date:"+(str+dateFormat.format(date))+"   \n"
		          + "  ------------------------------------------- \n"
		          + "  Name                  Qty   Rate    Amt\n"//name space 30,
		          + "  ------------------------------------------- \n";

		    

		String bill = header;
		List<ItemsInfo>itmInfo = print.getList();
		int count=1;
		float tots=0;
		for (ItemsInfo ii : itmInfo) {
			Items i = (Items)baseDao.findById(Long.parseLong(ii.getItemCode()), Items.class);
			name = i.getItemName();
			/*if(name.length()>10){
				name = name.substring(0, 9)+".";
			}else*/ if(name.length()<=30){
				//name = name+"    ";
				name= Test.fixedLengthString(name, 23);
			}else{
				name = name.substring(0, 23)+".";
			}
			qty = ii.getItemQuantity();
			amount = i.getItemPrice() * Double.parseDouble(ii.getItemQuantity())+"";
			tot+=i.getItemPrice() * Double.parseDouble(ii.getItemQuantity());
			rate = i.getItemPrice()+"";
			String items ="  "+count++ +"."+name+""+qty+"    "+rate.substring(0, rate.lastIndexOf("."))+"    "+amount.substring(0, amount.lastIndexOf("."))+"\n";//name not more than 10
			tots= tots+ Float.parseFloat(amount);

			bill = bill+ items;
		}
		logger.info("total--- > "+tots);
		float disc = Float.parseFloat(print.getDiscount());
		//System.out.println("disc = "+disc);
		float disc_amt = 0;
		if(disc !=0){
			disc_amt = (tots*disc)/100;
		}
		float price = Float.parseFloat(print.getTotAmount());
		//System.out.println("bill price = "+price);
		
		//System.out.println("disc_amt = "+disc_amt);
		float bill_pay = tots -disc_amt;
		//System.out.println("bill oay = "+bill_pay);
		
		String amt = "  ----------------------------------------- \n"
		          +"  Total = Rs. "+tots+"\n"
		          + "  Discount = "+disc+"%\n"
		          + "  Disc Amt = "+disc_amt+"\n"
		          +"  Bill Amount = Rs. "+price+"\n"
		          + "  ****************************************** \n"
		          + "  Thank you. \n"
		          + "  Visit Us Again \n";
	   bill = bill+amt;
	   System.out.println(bill);
	   new PrinterService().printString(bill);
	   byte[] cutP = new byte[] { 0x1d, 'V', 1 };
	   byte[] bytes = {27, 100, 3};
	   DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
	   Doc doc = new SimpleDoc(bytes, flavor, null);
	   DocPrintJob job = PrintServiceLookup.lookupDefaultPrintService().createPrintJob();
	   try {
		job.print(doc, null);
	} catch (PrintException e) {
		e.printStackTrace();
	}
	   /*try{
		   new PrinterService().printBytes(cutP);
	   }catch(Exception ex){
		   ex.printStackTrace();
	   }*/
		
	 //  printCard(bill);
	}
	
	
	
	
	public static void printCard(final String bill)
	{
	   final PrinterJob job = PrinterJob.getPrinterJob();

       Printable contentToPrint = new Printable() {
           @Override
           public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
               Graphics2D g2d = (Graphics2D) graphics;
               g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
               g2d.setFont(new Font("Roman", 0, 9));

               if (pageIndex > 0) {
                   return NO_SUCH_PAGE;
               } //Only one page
               String s1=bill;
               String Bill [] = s1.split(";");
               int y = 0;
               for (int i = 0; i < Bill.length; i++) {
                   g2d.drawString(Bill[i], 0, y);
                   y = y + 15;
               }

               return PAGE_EXISTS;
           }
       };

       PageFormat pageFormat = new PageFormat();
       pageFormat.setOrientation(PageFormat.PORTRAIT);

       Paper pPaper = pageFormat.getPaper();
       pPaper.setImageableArea(0, 0, pPaper.getWidth() , pPaper.getHeight() -2);
       pageFormat.setPaper(pPaper);

       job.setPrintable(contentToPrint, pageFormat);

       try {
           job.print();
       } catch (PrinterException e) {
           System.err.println(e.getMessage());
       }

	}

	@Override
	public UserInfo getUserDetails(ItemsInfo i, User u) {
		UserInfo ui = new UserInfo();
		User usr =(User)baseDao.findById(u.getUserId(), User.class);
		ui.setUsername(usr.getFullname());
		ui.setResult(true);
		return ui;
	}

	@Override
	public UserInfo orderInvoiceDetails(ItemsInfo i, User u) {
		
		return null;
	}

	@Override
	public List<UserInfo> getSelectoption(ItemsInfo i, User u) {
		List<UserInfo> li = new ArrayList<>();
		List<Tables> tables = adminDao.getTables(i,u);
		for (Tables tab : tables) {
			UserInfo ui = new UserInfo();
			ui.setTableName(tab.getTableName());
			ui.setTableId(tab.getId()+"");
			ui.setCreated(tab.getCreated()+"");
			ui.setStyle(tab.getStatus()==StatusClass.PUBLISHED?"acpub":"acunpub");
			ui.setStatus(tab.getStatus()==StatusClass.PUBLISHED?"Published":"Unpublished");
			ui.setOperations(tab.getStatus()==StatusClass.PUBLISHED?"UnPublish":"Publish");
			li.add(ui);
		}
		return li;
	}

	@Override
	public InfoModal createTable(InfoModal i, User u) {
		boolean result = adminDao.isTableAlreadyCreated(i,u);
		logger.info("result= "+result);
		if(result){
			i.setMsg("Sorry Table is Already Present");
			i.setResult(false);
		}else{
			Tables tb = new Tables();
			tb.setTableName(i.getTableName());
			tb.setStatus(StatusClass.UNPUBLISHED);
			tb.setCreated(new Timestamp(new Date().getTime()));
			i.setResult(true);
			i.setMsg("Congratulations! Table created Successfully.");
			baseDao.save(tb);
			
			i.setTableId(tb.getId());
			i.setTableName(tb.getTableName());
			i.setCreated(tb.getCreated()+"");
			i.setPublished(tb.getStatus()==StatusClass.PUBLISHED?"Published":"Unpublished");
			i.setStyle(tb.getStatus()==StatusClass.PUBLISHED?"acpub":"acunpub");
			i.setStatus(tb.getStatus()==StatusClass.PUBLISHED?"Published":"Unpublished");
			i.setOperations(tb.getStatus()==StatusClass.PUBLISHED?"UnPublish":"Publish");
			List<UserInfo>list =getSelectoption(null,null);
			i.setList(list);
		}
		return i;
	}

	@Override
	public InfoModal deleteTable(InfoModal i, User u) {
		Tables tab = (Tables)baseDao.findById(i.getTableId(), Tables.class);
		if(tab!=null){
			tab.setDeleteStatus(true);
			tab.setModified(new Timestamp(new Date().getTime()));
			baseDao.saveOrUpdate(tab);
			i.setResult(true);
		}else{i.setResult(false);}
		return i;
	}

	@Override
	public InfoModal publishTable(InfoModal i, User u) {
		Tables tab = (Tables)baseDao.findById(i.getTableId(), Tables.class);
		if(tab!=null){
			if(tab.getStatus()==StatusClass.PUBLISHED){
				tab.setStatus(StatusClass.UNPUBLISHED);
				i.setStyle("acunpub");
				i.setMsg("Table unpublished successfully!");
				i.setTableName(tab.getTableName());
				i.setCreated(tab.getCreated()+"");
				i.setStatus(tab.getStatus()==StatusClass.PUBLISHED?"Published":"Unpublished");
				i.setOperations("Publish");
			}else{
				tab.setStatus(StatusClass.PUBLISHED);
				i.setTableName(tab.getTableName());
				i.setCreated(tab.getCreated()+"");
				i.setStyle("acpub");
				i.setMsg("Table has been published successfully!");
				i.setStatus(tab.getStatus()==StatusClass.PUBLISHED?"Published":"Unpublished");
				i.setOperations("UnPublish");
			}
			tab.setModified(new Timestamp(new Date().getTime()));
			baseDao.saveOrUpdate(tab);
			i.setResult(true);
		}else{i.setResult(false);}
		return i;
	}

	@Override
	public List<ItemsInfo> getAllItems(ItemsInfo i, User u) {
		List<ItemsInfo> iti = new ArrayList<>();
		List<Items> items = adminDao.getAllItems(i,u);
		if(items!=null && items.size()>0){
			for (Items it : items) {
				ItemsInfo ui = new ItemsInfo();
				ui.setItemCode(it.getId()+"");
				ui.setCreated(it.getCreated()+"");
				ui.setItemName(it.getItemName());
				ui.setType(it.getItemType()==StatusClass.EAT_ITEM?"Eatery":"Drinkable");
				ui.setItemPrice(it.getItemPrice()+"");
				iti.add(ui);
			}
		}
		return iti;
	}

	@Transactional
	private void saveBillDetails(PrintData pd,User user) {
		double total=0;
		Invoice inv = new Invoice();
		Tables tab = (Tables)baseDao.findById(Long.parseLong(pd.getTableId()), Tables.class);
		inv.setTable(tab);
		inv.setDiscount(Double.parseDouble(pd.getDiscount()));
		inv.setCreated(new Timestamp(new Date().getTime()));
		inv.setMobileNo(pd.getMobile());
		if(user!=null)
			inv.setUser(user);
		for (ItemsInfo ii : pd.getList()) {
			total+=Double.parseDouble(ii.getItemPrice());
		}
		
		double dis = Double.parseDouble(pd.getDiscount());
		dis = (100-dis)/100;
		total = total*dis;
		logger.info("bill price= "+total);
		inv.setBillPrice(total);
		inv.setInvoiceType("printed");
		baseDao.save(inv);
		adminDao.deleteTempDetails(tab);
		for (ItemsInfo ii : pd.getList()) {
			BillDetails bd = new BillDetails();
			bd.setCreated(new Timestamp(new Date().getTime()));
			bd.setInvoice(inv);
			Items i = (Items)baseDao.findById(ii.getItemId(), Items.class);
			bd.setItemCode(i);
			bd.setItemQuantity(Integer.parseInt(ii.getItemQuantity()));
			baseDao.save(bd);
		}
		pd.setTotAmount(inv.getBillPrice()+"");
		pd.setTableId(tab.getTableName());
		pd.setInvoiceId(inv.getId()+"");
		pd.setResult(true);
		
		
	}

	@Transactional
	@Override
	public PrintData saveTempTableDetails(PrintData list, User u) {
		ItemsInfo inf = new ItemsInfo();
		List<ItemsInfo>pdlist = new ArrayList<>();
		logger.info("take result for= "+list.getResultTableId());
		try{
			Tables tab = (Tables)baseDao.findById(Long.parseLong(list.getTableId()), Tables.class);
			if(tab!=null){
				if(list.getList().size()>0)
				{boolean result = adminDao.deleteTempDetails(tab);
			//	if(result){
					for (ItemsInfo iinfo : list.getList()) {
						TempTableData ttd = new TempTableData();
						ttd.setTable(tab);
						if(u!=null)
						ttd.setUser(u);
						
						Items itm = (Items)baseDao.findById(Long.parseLong(iinfo.getItemCode()), Items.class);
						if(itm!=null)
						ttd.setItemCode(itm);
						
						ttd.setCreated(new Timestamp(new Date().getTime()));
						ttd.setBillPrice(Double.parseDouble(iinfo.getItemPrice()));
						ttd.setItemQuantity(Integer.parseInt(iinfo.getItemQuantity()));
						try{
							ttd.setDiscount(Double.parseDouble(list.getDiscount()));
						}catch(Exception e){
							System.err.println("float decimal");
							//e.printStackTrace();
						}
						
						ttd.setMobile(Integer.parseInt(list.getMobile()));
						baseDao.save(ttd);
					}
				  }	
				}
				
			//}
			list.setResult(true);
		}catch(Exception e){
			e.printStackTrace();
			inf.setResult(false);
		}
		PrintData newData = new PrintData();
		Tables tab = (Tables)baseDao.findById(Long.parseLong(list.getResultTableId()), Tables.class);
		logger.info("going to get record for table id= "+tab.getId());
		List<TempTableData> tempData = adminDao.getTempData(tab);
		logger.info("size== "+tempData.size());
		if(tempData!=null && tempData.size()>0){
			
			for (TempTableData tempTd : tempData) {
				logger.info("setting data ");
				ItemsInfo ii = new ItemsInfo();
				ii.setItemCode(tempTd.getItemCode().getId()+"");
				ii.setItemPrice(tempTd.getBillPrice()+"");
				ii.setItemQuantity(tempTd.getItemQuantity()+"");
				ii.setItemName(tempTd.getItemCode().getItemName());
				pdlist.add(ii);
			}
			newData.setResultTableId(list.getResultTableId());
			newData.setMobile(tempData.get(0).getMobile()+"");
			newData.setDiscount(tempData.get(0).getDiscount()+"");
		}
		newData.setList(pdlist);
		return newData;
	}

	@Override
	public ItemsInfo clearBill(InfoModal i, User u) {
		ItemsInfo ii = new ItemsInfo();
		Tables tab = (Tables)baseDao.findById(Long.parseLong(i.getTabId()), Tables.class);
		logger.info("to delete for "+tab.getId());
		try{
			adminDao.deleteTempDetails(tab);
			ii.setResult(true);
		}catch(Exception e){
			e.printStackTrace();
		}
		return ii;
	}

	@Override
	public InfoModal deleteItem(ItemsInfo i, User u) {
		InfoModal im = new InfoModal();
		Items tab = (Items)baseDao.findById(i.getItemId(), Items.class);
		if(tab!=null){
			tab.setDeleteStatus(true);
			tab.setModified(new Timestamp(new Date().getTime()));
			baseDao.saveOrUpdate(tab);
			im.setResult(true);
		}else{im.setResult(false);}
		return im;
	}

}
