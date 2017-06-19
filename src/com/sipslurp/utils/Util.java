package com.sipslurp.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.table.DefaultTableModel;

public class Util implements Printable 
{
	public static void main(String[] args) {
	//	printThisBill();
//	}
		String printData = "Sip n Slurp";//CalculationTextArea.getText() + "\n" + SpecificTextArea.getText();
		final String Header = 
	            "   *********Sip n Slurp*********       \n"
	            + "Date: today: 11:20 pmTime  \n"
	            + "---------------------------------\n"
	            + "Name          Qty    Rate     Amt\n"
	            + "---------------------------------\n";

	      final String amt  =    
	            "\n \n \nTotal Amount = 1500      \n"
	            + "Tax =100                       \n"
	            + "*********************************\n"
	            + "Thank you. \n";

	     
	      Printable contentToPrint = new Printable(){
	          @Override
	           public int print(Graphics graphics, PageFormat pageFormat, int page) throws PrinterException 
	           {
	              if (page > 0) {
	                   return NO_SUCH_PAGE;
	               }
	               pageFormat.setOrientation(PageFormat.LANDSCAPE);
	               Graphics2D g2d = (Graphics2D)graphics.create();

	               g2d.setPaint(Color.black);
	               g2d.setFont(new Font("Arial", Font.BOLD, 10));
	               g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableX());



	               g2d.drawString(Header+amt, 0, 0);

	               return PAGE_EXISTS;
	            }
	          };
	      
	    //PrinterJob job = PrinterJob.getPrinterJob();
	    //job.setPrintable(new Util(Header+amt));
	    //boolean doPrint = job.printDialog();
	          
	          PrinterJob job = PrinterJob.getPrinterJob();
	          job.setPrintable(contentToPrint);
	    if (true)
	    { 
	        try 
	        {
	            job.print();
			}
	        catch (PrinterException e)
	        {
	            // Print job did not complete.
	        }
	    }
	}
    private String printData;

    public Util(String printDataIn)
    {
    this.printData = printDataIn;
    }

@Override
public int print(Graphics g, PageFormat pf, int page) throws PrinterException
{
    // Should only have one page, and page # is zero-based.
    if (page > 0)
    {
        return NO_SUCH_PAGE;
    }

    // Adding the "Imageable" to the x and y puts the margins on the page.
    // To make it safe for printing.
    Graphics2D g2d = (Graphics2D)g;
    int x =10;// (int) pf.getImageableX();
    int y =50;// (int) pf.getImageableY();        
    g2d.translate(x, y); 

    // Calculate the line height
    Font font = new Font("Serif", Font.PLAIN, 10);
    FontMetrics metrics = g.getFontMetrics(font);
    int lineHeight = metrics.getHeight();

    BufferedReader br = new BufferedReader(new StringReader(printData));

    // Draw the page:
    try
    {
        String line;
        // Just a safety net in case no margin was added.
        x += 50;
        y += 50;
        while ((line = br.readLine()) != null)
        {
            y += lineHeight;
            g2d.drawString(line, x, y);
        }
    }
    catch (IOException e)
    {
        // 
    }

    return PAGE_EXISTS;
}




///////////
public static void printThisBill()
{

    //DefaultTableModel mod = (DefaultTableModel) jTable1.getModel();
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    DateFormat timeFormat = new SimpleDateFormat("HH:mm");
    //get current date time with Date()
    Date date = new Date();
    Date time = new Date();
    String Date = dateFormat.format(date);
    String Time = timeFormat.format(time);
    String Header = 
          "   ****Super Market****       \n"
          + "Date: 9pm   \n"
          + "---------------------------------\n"
          + "Name          Qty    Rate     Amt\n"
          + "---------------------------------\n";

    String amt  =    
          "\n \n \nTotal Amount = 12\n"
          + "Tax =123123\n"
          + "*********************************\n"
          + "Thank you. \n";

    String bill = Header;
    int i = 0;
    do
    {

       String name =     "";//+ mod.getValueAt(i, 2);
       String qty =      "";//+ mod.getValueAt(i, 3);
       String rate =     "";//+ mod.getValueAt(i, 4);
       String amount =   "";//+ mod.getValueAt(i, 6);

       if(name.length() > 12)
       {
           name = name.substring(0, 12)+"  ";
       }
       else
       {
           for(int j= name.length()-12; j<= name.length(); j++);
           {
               name = name+" ";
           } 
       }


       if(qty.length()<=5)
       {
           for(int j= 0; j<= qty.length()-5; j++);
           {
              qty = qty+" ";
           }
       }

       rate = rate;
       String items = 
           name+"\t"+qty+"\t"+rate+"\t"+amount+"\n";

       bill = bill+ items;       
       i++;

   } while(i <=5);// mod.getRowCount()-1);

   bill = bill+amt;
   System.out.println(bill);
   printCard(bill);
}
//////////
public static void printCard(final String bill )
{
       Printable contentToPrint = new Printable(){
       @Override
        public int print(Graphics graphics, PageFormat pageFormat, int page) throws PrinterException 
        {
           if (page > 0) {
                return NO_SUCH_PAGE;
            }
            pageFormat.setOrientation(PageFormat.LANDSCAPE);
            Graphics2D g2d = (Graphics2D)graphics.create();

            g2d.setPaint(Color.black);
            g2d.setFont(new Font("Arial", Font.BOLD, 10));
            g2d.translate(pageFormat.getImageableX(), pageFormat.getImageableX());



            g2d.drawString(bill, 0, 0);

            return PAGE_EXISTS;
         }
       };

       PrinterJob job = PrinterJob.getPrinterJob();
       job.setPrintable(contentToPrint);
       //You can show a print dialog before printing by job by wrapping the following blocks with a conditional statement if(job.printDialog()){...}
       try 
       {
           job.print();
       } catch (PrinterException e) 
       {
           System.err.println(e.getMessage());
       }

 }

}