package com.repquest.api.controller;

import com.repquest.api.dto.TaskDTO;
import com.repquest.api.dto.TaskResponseDTO;
import com.repquest.api.mapper.TaskMapper;
import com.repquest.api.model.Task;
import com.repquest.api.service.RepublicService;
import com.repquest.api.service.TaskService;
import com.repquest.api.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("task")
@RequiredArgsConstructor
public class TaskController {

    private final TaskService service;
    private final TaskMapper mapper;

    @PostMapping
    public ResponseEntity<TaskResponseDTO> save(@RequestBody TaskDTO dto){
        Task task = mapper.toEntity(dto);
        TaskResponseDTO responseDTO = mapper.toResponse(service.save(task));

        return ResponseEntity.ok(responseDTO);
    }
}
