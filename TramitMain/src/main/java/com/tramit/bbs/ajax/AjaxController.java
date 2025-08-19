package com.tramit.bbs.ajax;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name="ajaxController", 
	urlPatterns="*.ajax", initParams=@WebInitParam(
			name="ajaxCommand", value="/WEB-INF/ajaxCommand.properties"))
public class AjaxController extends HttpServlet {

	Map<String, AjaxProcess> ajaxMap = 
			new HashMap<String, AjaxProcess>();

	@Override
	public void init() throws ServletException {

		String ajaxCommand = getInitParameter("ajaxCommand");
		Properties prop = new Properties();

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		
		try {

			String realPath = getServletContext().getRealPath(ajaxCommand);

			fis = new FileInputStream(realPath);
			bis = new BufferedInputStream(fis);
			
			prop.load(bis);
			
		} catch(IOException e) {			
			throw new ServletException();
			
		} finally {			
			try {				

				if(bis != null) bis.close();
				if(fis != null) fis.close();
				
			} catch(IOException ioe) { }
		}
		
		Iterator<Object> keyIter = prop.keySet().iterator();
		
		while(keyIter.hasNext()) {

			String command = (String) keyIter.next();
			String className = (String) prop.getProperty(command);
			System.out.println("command : " 
					+ command + ", className : " + className);
			
			try {

				Class<?> commandClass = Class.forName(className);

				AjaxProcess ajaxProcess = 
						(AjaxProcess) commandClass.newInstance();

				ajaxMap.put(command, ajaxProcess);
				
			} catch(ClassNotFoundException e) {				
				throw new ServletException();
				
			} catch(InstantiationException e) {				
				throw new ServletException();
				
			} catch(IllegalAccessException e) {				
				throw new ServletException();
			}
		}
	}
	
	public void doAjax(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {

		AjaxProcess ajaxProcess = null;

		String command = request.getRequestURI();
 
		command = command.substring(request.getContextPath().length());	
		System.out.println("command : " + command);

		ajaxProcess = ajaxMap.get(command);
		System.out.println("command : " + command 
				+ ", commandPro : " + ajaxProcess);
		
		if(ajaxProcess != null) {
			ajaxProcess.ajaxProcess(request, response);
		}
	}
	
	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		doAjax(request, response);
	}
	
	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		doAjax(request, response);
	}
}
