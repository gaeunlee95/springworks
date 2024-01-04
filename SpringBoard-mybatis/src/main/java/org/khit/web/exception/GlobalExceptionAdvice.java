package org.khit.web.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice	//������ ó���ϴ� �ֿ� Ŭ����
public class GlobalExceptionAdvice {
	
	//���� ó��(�ڵ� �� ���� ����)
	@ExceptionHandler(Exception.class)
	public String handleException(Exception exception) {
		return "redirect:/global_error";
	}
	
	//���� ó��(������ ã���� ����)
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "/exception/error_404";
	}
}
