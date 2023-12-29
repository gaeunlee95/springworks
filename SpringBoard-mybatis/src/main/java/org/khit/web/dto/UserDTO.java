package org.khit.web.dto;

import lombok.Data;

/*@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter*/
@Data //상기의 작업을 모두 처리
public class UserDTO {
	//필드
	private Long id; //회원번호
	private String userId;
	private String userPasswd;
	private String userName;
	private Integer userAge;
	
}
