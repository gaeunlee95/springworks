package org.khit.web.mapper;

import java.util.List;

import org.khit.web.dto.UserDTO;

public interface UserMapper {

	void insert(UserDTO userDTO);

	List<UserDTO> findAll();
	
	UserDTO findById(Long id);

	UserDTO login(UserDTO userDTO);

	UserDTO findByUserId(String userId);

	void update(UserDTO userDTO);

	void delete(Long id);
	
}
