package com.tramit.bbs.controller;

import java.io.IOException;
import java.util.Properties;

import com.tramit.bbs.service.CommandProcess;

import java.util.Map;
import java.util.HashMap;
import java.io.InputStream;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "bbsController", urlPatterns = {"*.mvc"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 10,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 100
)
public class WebController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Map<String, CommandProcess> commandMap = new HashMap<>();

    @Override
    public void init() throws ServletException {
        String path = "/WEB-INF/command.properties";
        Properties prop = new Properties();

        try (InputStream input = getServletContext().getResourceAsStream(path)) {
            prop.load(input);

            for (String command : prop.stringPropertyNames()) {
                String className = prop.getProperty(command);

                try {
                    Class<?> commandClass = Class.forName(className);
                    CommandProcess instance;

                    if (commandClass.getSimpleName().equals("ForwardService")) {
                        instance = (CommandProcess) commandClass
                            .getConstructor(String.class)
                            .newInstance(command.replace(".mvc", ".jsp").replaceFirst("/", "/web/"));
                    } else {
                        instance = (CommandProcess) commandClass.getDeclaredConstructor().newInstance();
                    }
                    
                    System.out.println("command : " + command);
                    System.out.println("className : " + className);
                    System.out.println("commandInstance : " + instance);


                    commandMap.put(command, instance);
                } catch (Exception e) {
                    throw new ServletException("Failed to load command: " + className, e);
                }
            }

        } catch (IOException e) {
            throw new ServletException("command.properties 로드 실패", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        requestHandler(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        requestHandler(request, response);
    }

    private void requestHandler(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String command = request.getServletPath();

        CommandProcess service = commandMap.get(command);

        if (service == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 명령을 찾을 수 없습니다: " + command);
            return;
        }

        String viewPage = service.requestProcess(request, response);

        if (viewPage != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
            dispatcher.forward(request, response);
        }
    }
}
