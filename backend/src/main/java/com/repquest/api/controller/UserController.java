package com.repquest.api.controller;

import com.repquest.api.dto.UserDTO;
import com.repquest.api.dto.UserResponseDTO;
import com.repquest.api.mapper.UserMapper;
import com.repquest.api.model.User;
import com.repquest.api.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController {

    private final UserService service;
    private final UserMapper mapper;

    @PostMapping
    public ResponseEntity<UserResponseDTO> create(@RequestBody @Valid UserDTO dto){
        User user = mapper.toEntity(dto);
        User savedUser = service.save(user);

        UserResponseDTO responseDTO = mapper.toResponse(savedUser);

        return ResponseEntity.ok(responseDTO);
    }
}
