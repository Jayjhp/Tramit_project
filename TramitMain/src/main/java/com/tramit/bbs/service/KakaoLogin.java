package com.tramit.bbs.service;

import java.io.*;
import java.net.*;
import org.json.JSONObject;

public class KakaoLogin {

    private static final String CLIENT_ID = "YOUR_REST_API_KEY";
    private static final String REDIRECT_URI = "YOUR_REDIRECT_URI";

    public String getAccessToken(String code) throws IOException {
        String tokenUrl = "https://kauth.kakao.com/oauth/token";
        
        URL url = new URL(tokenUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        String params = "grant_type=authorization_code"
                      + "&client_id=" + CLIENT_ID
                      + "&redirect_uri=" + REDIRECT_URI
                      + "&code=" + code;

        try (OutputStream os = conn.getOutputStream()) {
            os.write(params.getBytes());
            os.flush();
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        JSONObject json = new JSONObject(sb.toString());
        return json.getString("access_token");
    }
}