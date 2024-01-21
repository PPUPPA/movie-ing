package com.company.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/moving")
public class RestTestController {
	@RequestMapping(value="/movie", method={RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void callapihttp(Model model) {
		StringBuffer result = new StringBuffer();
		
		try {
			String apiUrl = "https://api.themoviedb.org/3/movie/now_playing?language=ko";
			
			URL url = new URL(apiUrl);
			
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			
			connection.setRequestProperty("Content-type", "application/json;charset=UTF-8");
			connection.setRequestProperty("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTYwYjViMTA3OWQzOGZjN2Y1ZTdiZTJiOGZkYmI3YiIsInN1YiI6IjY1YTBiZDkwYjY4NmI5MDEzMDZjMjM0ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8MThVHBTPWL6eygKm971SKaug9OSj5OZ1ABbrHKT_IY");
			connection.setRequestProperty("accept", "application/json");
			
			int responseCode = connection.getResponseCode();
			System.out.println("Response Code: "+ responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));
			String line;

            while ((line = br.readLine()) != null) {
                result.append(line);
            }

            // 연결 종료
            connection.disconnect();
		} catch(Exception e) {e.printStackTrace();}
		
		model.addAttribute("apiResult", result.toString());
		
//		return "redirect:/moving/movie";
	}
}
