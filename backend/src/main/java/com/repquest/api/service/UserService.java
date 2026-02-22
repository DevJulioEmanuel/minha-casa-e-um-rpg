package com.repquest.api.service;

import com.repquest.api.model.User;
import com.repquest.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;

    public User save(User user){
        return repository.save(user);
    }
}
