package org.khit.web.dto;

import lombok.Data;

/*@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter*/
@Data //����� �۾��� ��� ó��
public class UserDTO {
	//�ʵ�
	private Long id; //ȸ����ȣ
	private String userId;
	private String userPasswd;
	private String userName;
	private Integer userAge;
	
}
