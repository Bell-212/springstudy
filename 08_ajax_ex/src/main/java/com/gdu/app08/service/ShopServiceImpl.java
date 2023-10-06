package com.gdu.app08.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService {

  @Override
  public Map<String, Object> openApi(String query, int display, String sort) {
    
    /*
     * 네이버개발자센터 - 검색(블로그)
     * 1. 요청주소 : https://openapi.naver.com/v1/search/shop.json
     * 2. 요청변수
     *    1) query   : 필수, 인코딩된 검색어
     *    2) display : 선택, 10 (검색 결과의 개수)
     *    3) start   : 선택, 1
     *    4) sort    : 선택, sim (sim 또는 date)
     */
    
    URL url = null;
    HttpURLConnection con = null;
    BufferedReader reader = null;
    
    try {
      
      String spec = "https://openapi.naver.com/v1/search/shop.json";
//      String query = "";
//      String display = "10";
//      String start = "1";
//      String sort = "sim";
      String clientId = "rjH76EEaARpAfAoMykHW";
      String clientSecret = "rnU18PRe8Z";
      
      StringBuilder sbUrl = new StringBuilder();
      sbUrl.append(spec);
      sbUrl.append("?query=").append(URLEncoder.encode(query, "UTF-8"));
      sbUrl.append("&display=").append(display);
//      sbUrl.append("&start=").append(start);
      sbUrl.append("&sort=").append(sort);
      
      url = new URL(sbUrl.toString());
      con = (HttpURLConnection) url.openConnection();
      
      // 요청 메소드
      con.setRequestMethod("GET");  // 반드시 대문자 GET
      
      // 요청 헤더
      con.setRequestProperty("X-Naver-Client-Id", clientId);
      con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
      
      int responseCode = con.getResponseCode();
      if(responseCode != HttpURLConnection.HTTP_OK) {
        throw new RuntimeException(responseCode + " 발생");
      }
      
      reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
      
      StringBuilder sb = new StringBuilder();
      String line = null;
      while((line = reader.readLine()) != null) {
        sb.append(line + "\n");
      }
      
      //TODO 응답데이터 받아오기
        
//      JSONObject obj = new JSONObject(sb.toString());
//      JSONArray items = obj.getJSONArray("items");
//      for(int i = 0, length = items.length(); i < length; i++) {
//        JSONObject item = items.getJSONObject(i);
//        System.out.println((i + 1) + "번째 블로그 검색 결과");
//        System.out.println("제목: " + item.getString("title"));
//        System.out.println("링크: " + item.getString("link"));
//        System.out.println("요약: " + item.getString("description"));
//        System.out.println("블로거: " + item.getString("bloggername"));
//        System.out.println("블로거링크: " + item.getString("bloggerlink"));
//        System.out.println("작성일: " + item.getString("postdate"));
//      }
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if(reader != null) reader.close();
        if(con != null) con.disconnect();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return null;
  }
  
}
