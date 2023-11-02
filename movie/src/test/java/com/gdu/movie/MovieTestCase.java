package com.gdu.movie;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gdu.movie.dao.MovieMapper;
import com.gdu.movie.dto.MovieDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
public class MovieTestCase {
  
  @Autowired
  private MovieMapper movieMapper;
  
  @Test 
  public void 목록조회테스트() {
    List<MovieDto> movieDto = movieMapper.getMovieList();
    assertNotNull(movieDto);  //not null이면 테스트 성공.
  }
}
