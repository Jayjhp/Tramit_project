package com.tramit.bbs.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WebMainService implements CommandProcess {
    
    @Override
    public String requestProcess(
            HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException {
        
        return "web/home"; 
    }
} 