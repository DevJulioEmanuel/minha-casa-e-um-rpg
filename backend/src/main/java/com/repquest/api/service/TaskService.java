package com.repquest.api.service;

import com.repquest.api.model.Task;
import com.repquest.api.model.User;
import com.repquest.api.repository.TaskRepository;
import com.repquest.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TaskService {

    private final TaskRepository repository;
    private final UserRepository userRepository;

    public Task save(Task task){
        User user = userRepository.findById(task.getAssignedUser().getId()).orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        task.setRepublic(user.getRepublic());

        return repository.save(task);
    }
}
