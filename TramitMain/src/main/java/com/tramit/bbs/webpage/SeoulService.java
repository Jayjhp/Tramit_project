package com.tramit.bbs.webpage;

import java.io.IOException;

import com.tramit.bbs.service.CommandProcess;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SeoulService implements CommandProcess {
    
    @Override
    public String requestProcess(
            HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException {
        
        return "travel/seoul";
    }
} 