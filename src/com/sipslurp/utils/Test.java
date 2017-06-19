package com.sipslurp.utils;

import org.springframework.beans.factory.annotation.Autowired;

import com.sipslurp.dao.AdminDao;

public class Test {

	@Autowired
	static AdminDao adminDao;
	public static void main(String[] args) {
		
		/*System.out.printf("%1$-"+13+ "s", "Pizza");
		System.out.println("hi");
		System.out.println();		
		System.out.printf("%1$-"+13+ "s", "Pizza burger sad");
		System.out.println("hi");
		System.out.println(padRight("Howto", 20) + "*");
		System.out.println();
		//System.out.printf("%-12.5s%s", "Hello World","World");
		System.out.printf("%1$"+12+ "s", "Pizza");
		System.out.println();
		System.out.printf("%1$"+12+ "s", "Burger");*/
		Character[] name = new Character[10];
		//System.out.println(padRight("Howto", 20) + "*");
		System.out.println(fixedLengthString("virgin mojito", 20) + "*");
		System.out.println(fixedLengthString("burger", 20) + "*");
		/*System.out.format("%10s%15s%15s%15s%20s",
			    "Grade", "Last Name", "First Name", "Student Number", "Parent Email");*/

	}
	
	public static String padRight(String s, int n) {
	     return String.format("%1$-" + n + "s", s);  
	}
	
	public static String fixedLengthString(String string, int length) {
	    return String.format("%1$-"+length+ "s", string);
	}

}
