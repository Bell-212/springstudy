package com.gdu.app14.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.gdu.app14.dto.MemberDto;

public interface MemberService {
  
  // 회원 등록
  public Map<String, Object> register(MemberDto memberDto, HttpServletResponse httpServletResponse);
  
  // 회원 목록
  public Map<String, Object> getMembers(int page);
  
  // 회원 조회
  public Map<String, Object> getMember(int memberNo);
  
  // 회원 정보 수정
  public Map<String, Object> modifyMember(MemberDto memberDto);
  
  // 회원 삭제
  public Map<String, Object> removeMember(int memberNo);
  
  // 회원들 삭제
  public Map<String, Object> removeMembers(String memberNoList);
}
