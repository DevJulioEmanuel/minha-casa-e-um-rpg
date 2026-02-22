package com.repquest.api.controller;

import com.repquest.api.dto.JoinRequestDTO;
import com.repquest.api.dto.UserDTO;
import com.repquest.api.dto.UserResponseDTO;
import com.repquest.api.mapper.UserMapper;
import com.repquest.api.model.User;
import com.repquest.api.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

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

    @PatchMapping("/{id}/join")
    public ResponseEntity<UserResponseDTO> join(@PathVariable("id") String id, @RequestBody JoinRequestDTO dto){
        UserResponseDTO response = mapper.toResponse(service.joinRepublic(UUID.fromString(id), dto.inviteCode()));

        return ResponseEntity.ok(response);
    }
}
