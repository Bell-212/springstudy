package com.gdu.app08.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.app08.service.ShopService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ShopController {

  private final ShopService shopService;
  
  @ResponseBody
  @GetMapping(value="/shop/search.do", produces="application/json; charset=UTF-8")
  public Map<String, Object> search(@RequestParam("query") String query
                                  , @RequestParam("display") int display
                                  , @RequestParam("sort") String sort){
    return shopService.openApi(query, display, sort);
  }
  
}
