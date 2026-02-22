package com.repquest.api.mapper;

import com.repquest.api.dto.UserDTO;
import com.repquest.api.dto.UserResponseDTO;
import com.repquest.api.model.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {

    User toEntity(UserDTO dto);

    UserDTO toDto(User user);

    UserResponseDTO toResponse(User user);
}
