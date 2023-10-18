package com.gdu.app13.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.app13.service.FileService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class FileController {

  private final FileService fileService;
  
  @RequestMapping(value="/upload.do", method=RequestMethod.POST)
  public String upload(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) {
    int addResult = fileService.upload(multipartRequest);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/main.do";
  }
  
  @RequestMapping(value="/ajax/upload.do", method=RequestMethod.POST, produces="application/json")
  @ResponseBody
  public Map<String, Object> ajaxUpload(MultipartHttpServletRequest multipartRequest){
    return fileService.ajaxUpload(multipartRequest);
  }
  
  @RequestMapping(value="/ckeditor/upload.do", method=RequestMethod.POST, produces="application/json")
  @ResponseBody
  public Map<String, Object> ckeditorUpload(MultipartFile upload, HttpServletRequest request){
    return fileService.ckeditorUpload(upload, request.getContextPath());
  }
  
  
}
