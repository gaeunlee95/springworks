package org.khit.web.service;

import java.util.List;

import org.khit.web.dto.UserDTO;
import org.khit.web.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper; 
	
	@Override
	public void insert(UserDTO userDTO) {
		userMapper.insert(userDTO);
	}

	@Override
	public List<UserDTO> findAll() {
		return userMapper.findAll();
	}

	@Override
	public UserDTO findById(Long id) {
		return userMapper.findById(id);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		return userMapper.login(userDTO);
	}

	@Override
	public UserDTO findByUserId(String userId) {
		return userMapper.findByUserId(userId);
	}

	@Override
	public void update(UserDTO userDTO) {
		userMapper.update(userDTO);
		
	}

	@Override
	public void delete(Long id) {
		userMapper.delete(id);
	}

	@Override
	public String checkUserId(String userId) {
		UserDTO user = userMapper.findByUserId(userId);
		if(user == null) { //db에 저장된 객체가 없으면
 			return "usable"; //사용
		}else {
			return "not_usable";
		}
	}

	
	
}
