package org.khit.myapp.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	//�Ű����� ���� ������
@AllArgsConstructor //�Ű����� �ִ� ������
@ToString
@Setter
@Getter
public class BoardDTO {
	//�ʵ�
	private Long id; //id�� ũ�� ���	//�۹�ȣ
	private String boardTitle;		//������
	private String boardWriter;		//�۾���
	private String boardContent;	//�۳���
	private Timestamp createdTime;	//�ۼ���
	
}
