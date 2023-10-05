package com.gdu.app06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.app06.service.IBoardService;

@RequestMapping("/board")
@Controller
public class BoardController {
  
  private IBoardService iBoardService;

  @Autowired
  public void setiBoardService(IBoardService iBoardService) {
    this.iBoardService = iBoardService;
  }
  
  @RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String list(Model model) {
    model.addAttribute("boardList", iBoardService.getBoardList());
    return "board/list";
  }
  
  @RequestMapping(value="/detail.do", method=RequestMethod.GET)
  public String detail(@RequestParam(value="boardNo", required=false, defaultValue="0") int boardNo
                      , Model model) {
    model.addAttribute("board", iBoardService.getBoardByNo(boardNo));
    return "board/detail";
  }
  
  
  
  
}
