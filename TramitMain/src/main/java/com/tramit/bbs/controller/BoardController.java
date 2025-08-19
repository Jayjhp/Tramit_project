package com.tramit.bbs.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import com.tramit.bbs.service.CommandProcess;
import com.tramit.bbs.service.ReviewBoardDetailService;
import com.tramit.bbs.service.ReviewBoardListService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig(fileSizeThreshold = 1024 * 10, 
				maxFileSize = 1024 * 1024 * 10,
				maxRequestSize = 1024 * 1024 * 10 * 10)
@WebServlet(name="bbsController", urlPatterns="*.mvc",
		initParams=@WebInitParam(name="uriCommand", value="/WEB-INF/uriCommand.properties"))
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private final String PREFIX = "/WEB-INF/index.jsp?body=";
	private final String SUFFIX = ".jsp";	
	
	
	Map<String, CommandProcess> commandMap = 
			new HashMap<String, CommandProcess>();   

	public void init() throws ServletException {
		
		String uriCommand = getInitParameter("uriCommand");
		
		ServletContext sc = getServletContext();
		String uploadDir = sc.getInitParameter("uploadDir");
		String realPath = sc.getRealPath(uploadDir);
		File parentFile = new File(realPath);

		if(! (parentFile.exists() && parentFile.isDirectory())) {
			parentFile.mkdir();
		}
 		
		Properties prop = new Properties();
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		try {

			String propPath = sc.getRealPath(uriCommand);
 
			fis = new FileInputStream(propPath);
			bis = new BufferedInputStream(fis);

			prop.load(bis);			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 보조 스트림을 먼저 닫고 기반 스트림을 닫는다.
				if(bis != null) bis.close();
				if(fis != null) fis.close();
			} catch(IOException e) { }
		}

		Iterator<Object> keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String cmd = (String) keyIter.next();
			String className = prop.getProperty(cmd);
			
			try {
				Class<?> commandClass = Class.forName(className);

				CommandProcess service = 
						(CommandProcess) commandClass.newInstance();

				commandMap.put(cmd, service);
			} catch(ClassNotFoundException e) {
				e.printStackTrace();
			} catch(InstantiationException e) {
				e.printStackTrace();
			} catch(IllegalAccessException e) {
				e.printStackTrace();
			}
		}

		sc.setAttribute("uploadDir", uploadDir);
		sc.setAttribute("parentFile", parentFile);
		
	}
	
	protected void doGet(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);
	}	

	public void doProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		
		 
		String requestURI = request.getRequestURI();

		String contextPath = request.getContextPath();
		System.out.println("uri : " + requestURI + ", ctxPath : " + contextPath);

		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
 
		CommandProcess service = commandMap.get(command);
		String viewPage =  service.requestProcess(request, response);

		if(viewPage != null) {

			String view = viewPage.split(":")[0];
			System.out.println("view : " + view);
			
			if(view.equals("r") || view.equals("redirect")) {
				
				response.sendRedirect(viewPage.split(":")[1]);
				
			} else if(view.equals("f") || view.equals("forward")) {

				RequestDispatcher rd = 
						request.getRequestDispatcher(viewPage.split(":")[1]);	
				rd.forward(request, response);
				
			} else { 

				RequestDispatcher rd = 
						request.getRequestDispatcher(PREFIX + view + SUFFIX);	
				rd.forward(request, response);
			}
		}
		System.out.println("요청된 command: " + command);
		System.out.println("매핑된 service: " + service);
	}
}
