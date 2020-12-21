package org.apache.commons.cli;

import junit.framework.TestCase;
import java.lang.StringIndexOutOfBoundsException;
import java.lang.NullPointerException;


public class StudentTest extends TestCase
{
	public void testAIR_Div_910 (){
		HelpFormatter formatter = new HelpFormatter();
		int result = formatter.findWrapPos("hello\n",  5, 0);
		assertEquals(6, result);
	}
	
	public void testFindWrapPos1(){
		HelpFormatter formatter = new HelpFormatter();
		assertEquals(formatter.findWrapPos("\ta\r\t", 2, 1), 2);
		assertEquals(formatter.findWrapPos("\n1\n233", 2, 3), 5);
		assertEquals(formatter.findWrapPos("A\n\rB", 10, -3), 2);
		assertEquals(formatter.findWrapPos("ABC", 2, 1), -1);
		assertEquals(formatter.findWrapPos("A\nB\nD", 2, 2), 3);
		assertEquals(formatter.findWrapPos("\n\r\t", 2, 1), 3);
		assertEquals(formatter.findWrapPos("\ta\r\t", 4, 4), -1);
		assertEquals(formatter.findWrapPos("\ta\r\t", 1, 2), 3);
		 try {
			formatter.findWrapPos("AB\tD", 0, -3);
			fail();
		} catch (java.lang.StringIndexOutOfBoundsException ex){}
	}
} //end of testclass
