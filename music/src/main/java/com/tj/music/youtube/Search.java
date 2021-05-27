package com.tj.music.youtube;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;


public class Search {
	public StringBuffer search(String search) throws IOException {
		
		String apiurl = "https://www.googleapis.com/youtube/v3/search";
		apiurl += "?key=AIzaSyDE6kYAdvN0ucrRU6LFdCG0xbGE3hzobYA";
		apiurl += "&part=snippet&type=video&maxResults=1&videoEmbeddable=true";
		apiurl += "&q="+URLEncoder.encode(search,"UTF-8");
		
		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new java.io.InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		return response;
	}
}