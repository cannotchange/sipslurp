package com.sipslurp.utils;

public class Main {

    public static void main(String[] args) {

        PrinterService printerService = new PrinterService();

        System.out.println(printerService.getPrinters());

        //print some stuff. Change the printer name to your thermal printer name.
        String s ="<table><<thead><th>name</th><th>price</th></thead><tbody><tr><td>mango</td><td>200</td></tr></tbody></table>";
        printerService.printString(s);

        // cut that paper!
      /*  byte[] cutP = new byte[] { 0x1d, 'V', 1 };

        printerService.printBytes("Thermal Printer H58 Printer USB", cutP);
*/
    }

}