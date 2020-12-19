package org.apache.commons.cli;

import junit.framework.TestCase;
import java.lang.StringIndexOutOfBoundsException;
import java.lang.NullPointerException;


public class StudentTest extends TestCase
{
    public void testFindWrapPos1(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("\ta\r\t", 2, 1), 2);
    }

        
    public void testFindWrapPos2(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("\n1\n233", 2, 3), 5);
    }
        
        
    public void testFindWrapPos3(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("A\n\rB", 10, -3), 2);
    }
        
        
    public void testFindWrapPos4(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("ABC", 2, 1), -1);
    }
        
        
    public void testFindWrapPos5(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("A\nB\nD", 2, 2), 3);
    }
        
        
    public void testFindWrapPos6(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("\n\r\t", 2, 1), 3);
    }
        
        
    public void testFindWrapPos7(){
        HelpFormatter formatter = new HelpFormatter();
        try {
            formatter.findWrapPos("AB\tD", 0, -3);
            fail();
        } catch (java.lang.StringIndexOutOfBoundsException ex){}
    }
        
        
    public void testFindWrapPos8(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("\ta\r\t", 4, 4), -1);
    }
        
        
    public void testFindWrapPos9(){
        HelpFormatter formatter = new HelpFormatter();
        assertEquals(formatter.findWrapPos("\ta\r\t", 1, 2), 3);
    }


} //end of testclass
