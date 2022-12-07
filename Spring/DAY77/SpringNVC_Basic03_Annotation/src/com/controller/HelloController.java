package com.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*   �̷��� ó���ϸ� ��û �ϳ��� controller �ϳ� �ʿ�
public class HelloController implements Controller
�����
����: ���� ��û ������ŭ controller ����
�Խ���: ��Ϻ��� >> ListController
             �۾���>> WriteController
             �����ϱ�>> EditController
   
   
public class HelloController implements Controller{

   @Override
   public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
      // TODO Auto-generated method stub
      return null;
   }

}
*/

/*
 @Controller
 public class HelloController
 
 method ������ ����
 �ϳ��� controller �ȿ� �������� �Լ��� ������ ���� ����
 
 �Խ���: ��Ϻ��� >> public void list()
              �۾���>> public void write()
              �����ϱ�>> public void edit()
   
 */



@Controller
public class HelloController{
	public HelloController() {
		System.out.println("HelloController ������ ȣ��");
	}
	
	@RequestMapping("/hello.do") //<a href = "hello.do></a> ��û�� ���� �Լ� ����
	public ModelAndView hello() {
		System.out.println("[hello.do method call");
		ModelAndView mv = new ModelAndView();
		mv.addObject("greeting", null);
		mv.setViewName("Hello");
		return mv;
	}
	
	private String getGreeting() {
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String data = "";
		if (hour >= 6 && hour <= 10) {
			data = "�н��ð�";
		} else if(hour >= 11 && hour <= 13) {
			data = "����� �ð�";
		} else if(hour >= 14 && hour <= 18) {
			data = "���� �ð�";
		} else {
			data = "go home";
		}
		
		return data;
	}
}



























