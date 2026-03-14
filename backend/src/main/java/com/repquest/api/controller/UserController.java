package com.repquest.api.controller;

import com.repquest.api.dto.JoinRequestDTO;
import com.repquest.api.dto.UserAvatarDTO;
import com.repquest.api.dto.UserDTO;
import com.repquest.api.dto.UserResponseDTO;
import com.repquest.api.mapper.UserMapper;
import com.repquest.api.model.User;
import com.repquest.api.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.mapstruct.control.MappingControl;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.UUID;

@RestController
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController implements  GenericController{

    private final UserService service;
    private final UserMapper mapper;

    @PostMapping
    public ResponseEntity<UserResponseDTO> create(@RequestBody @Valid UserDTO dto){
        User user = mapper.toEntity(dto);
        User savedUser = service.save(user);
        UserResponseDTO saved = mapper.toResponse(savedUser);
        URI location = gerarHeaderLocation(savedUser.getId());
        return ResponseEntity.created(location).body(saved);
    }

    @PatchMapping("/profile")
    public ResponseEntity<UserResponseDTO> completedProfile(@RequestBody @Valid UserAvatarDTO dto, @AuthenticationPrincipal User user){
        UserResponseDTO responseDTO = mapper.toResponse(service.completedProfile(user, dto));

        return ResponseEntity.ok(responseDTO);
    }

    @PatchMapping("/join")
    public ResponseEntity<UserResponseDTO> join(@RequestParam String inviteCode, @AuthenticationPrincipal User user){
        UserResponseDTO response = mapper.toResponse(service.joinRepublic(user, inviteCode));

        return ResponseEntity.ok(response);
    }
}
