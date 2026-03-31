package com.repquest.api.mapper;

import com.repquest.api.dto.TaskDTO;
import com.repquest.api.dto.TaskResponseDTO;
import com.repquest.api.model.Task;
import com.repquest.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper(componentModel = "spring", uses = UserMapper.class)
public abstract class TaskMapper {

    @Autowired
    UserRepository userRepository;

    @Mapping(target = "assignedUser", expression = "java(userRepository.findById(dto.userId()).orElse(null))")
    public abstract Task toEntity(TaskDTO dto);

    public abstract TaskDTO toDto(Task task);

    public  abstract TaskResponseDTO toResponse(Task task);
}
