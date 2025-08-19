package com.tramit.bbs.detailservice;

import java.io.IOException;

import com.tramit.bbs.service.CommandProcess;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Fusion2Service implements CommandProcess {
    
    @Override
    public String requestProcess(
            HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException {
        
        return "foodDetail/fusion2";
    }
} 