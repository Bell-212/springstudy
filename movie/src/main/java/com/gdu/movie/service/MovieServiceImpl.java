package com.gdu.movie.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.gdu.movie.dao.MovieMapper;
import com.gdu.movie.dto.MovieDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MovieServiceImpl implements MovieService {

  private final MovieMapper movieMapper;
  
  @Override
  public Map<String, Object> getMovieList() {
    
    int movieCount = movieMapper.getMovieCount();
    List<MovieDto> list = movieMapper.getMovieList();
    
    return Map.of("message", "전체 " + movieCount + "개의 목록을 가져왔습니다.", 
                  "list", list,
                  "status", 200);
  }
  
  @Override
  public Map<String, Object> getMovie(HttpServletRequest request) {
    String column = request.getParameter("column");
    String searchText = request.getParameter("searchText");
    
    Map<String, Object> map = Map.of("column", column, "searchText", searchText);
    
    int searchCount = movieMapper.getSearchCount(map);
    List<MovieDto> movie = movieMapper.getMovie(map);
    if(searchCount == 0) {
      return Map.of("message", searchText + " 검색 결과가 없습니다.", 
                  "list", "", 
                  "status", 500);
    } else {
      return Map.of("message", searchCount + "개의 검색 결과가 있습니다.", 
          "list", movie, 
          "status", 200);
      
    }
  }
  
  
  
  
  
}
