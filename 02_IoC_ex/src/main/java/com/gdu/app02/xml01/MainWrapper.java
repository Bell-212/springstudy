package com.gdu.app02.xml01;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainWrapper {

  public static void main(String[] args) {

    AbstractApplicationContext ctx = new GenericXmlApplicationContext("xml01/appCtx.xml");
    
    Person p = ctx.getBean("person", Person.class);
    System.out.println(p);
    System.out.println(p.getName() + ", " + p.getContact() + ", " + p.getAddress());
    
    
  }

}
