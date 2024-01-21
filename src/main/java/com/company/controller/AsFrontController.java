package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.dto.MovieDto;
import com.company.service.MovieService;

@Controller
public class AsFrontController {
	@Autowired MovieService mv_service;
	
	@RequestMapping(value="movie.as", method=RequestMethod.GET)
	public void movie() {  }
	
	@RequestMapping(value="movieDetail.as", method=RequestMethod.GET)
	public void movieDetail() { }
	
	@RequestMapping(value="notice.as", method=RequestMethod.GET)
	public void notice() { }
	
	@RequestMapping(value="noticeDetail.as", method=RequestMethod.GET)
	public void noticeDetail() { }
	
	@RequestMapping(value="movie.admin", method=RequestMethod.GET)
	public void adminMovie(Model model) {
		List<String> genres = Arrays.asList("액션", "모험", "애니메이션", "코미디", "범죄", "다큐멘터리", "드라마", "가족", "판타지", "역사", "공포", "음악", "미스터리", "로맨스", "SF", "TV 영화", "스릴러", "전쟁", "서부");
		model.addAttribute("genres", genres);
		model.addAttribute("liveList", mv_service.mv_readLive());
		model.addAttribute("unLiveList", mv_service.mv_readUnlive());
	}
	
	@RequestMapping(value="movieStatusChange.admin", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String changeMovieState(@RequestBody List<Integer> mv_cdList) {
        try {
            for (Integer mv_cd : mv_cdList) {
                MovieDto dto = mv_service.mv_read(mv_cd);
                dto.setMv_live(!dto.isMv_live());
                mv_service.mv_changeState(dto);
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
	
	@RequestMapping(value="movieDetail.admin", method=RequestMethod.GET)
	public void adminMovieDetail(int mv_cd, Model model) {
		model.addAttribute("dto", mv_service.mv_read(mv_cd));
	}
	
	@RequestMapping(value="movieUpdate.admin", method=RequestMethod.GET)
	public void adminMovieUpdateView(int mv_cd, Model model) {
		model.addAttribute("dto", mv_service.mv_read(mv_cd));
	}

	@RequestMapping(value = "movieUpdate.admin", method = RequestMethod.POST)
	@ResponseBody
	public void adminUpdate(@ModelAttribute MovieDto mv_dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    try {
	        if (mv_service.mv_update(mv_dto) > 0) {
	            out.println("<script>alert('영화 정보가 수정되었습니다.');location.href='" + request.getContextPath() + "/movieDetail.admin?mv_cd=" + mv_dto.getMv_cd() + "';</script>");
	        } else {
	            out.println("<script>alert('영화 정보 수정에 실패했습니다.');</script>");
	        }
	    } catch (Exception e) {
	        out.println("<script>alert('영화 정보 수정 중 오류가 발생했습니다.');</script>");
	        e.printStackTrace();
	    }
	}
	
	@RequestMapping(value="movieAdd.admin", method=RequestMethod.GET)
	public void adminMovieAdd() {}
	
	@RequestMapping(value="apiMovieAdd.admin", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
    public ResponseEntity<String> handleAddRequest(@RequestBody MovieDto mv_dto) {
        try {
            mv_service.mv_insert(mv_dto);

            return ResponseEntity.ok("Movie data added successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding movie data.");
        }
    }
	
	@GetMapping("/apiCheckMvCd.admin")
	public ResponseEntity<Boolean> checkMvCd(@RequestParam int mv_cd) {
	    boolean mvCdExists = mv_service.mv_readLive().stream().anyMatch(movie -> movie.getMv_cd() == mv_cd) || mv_service.mv_readUnlive().stream().anyMatch(movie -> movie.getMv_cd() == mv_cd);
	    return ResponseEntity.ok(mvCdExists);
	}
}
