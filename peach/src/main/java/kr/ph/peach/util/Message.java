package kr.ph.peach.util;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Message {
	private String url, msg;
	
	public String toString() {
		if(msg != null) {
			return "{" + "msg : '" + msg + "', url : '" + url + "' }";			
		} else {
			return "{url : '" + url + "'}";
		}
	}
	
}
