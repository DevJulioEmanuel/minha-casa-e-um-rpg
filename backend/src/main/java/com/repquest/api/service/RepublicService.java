package com.repquest.api.service;

import com.repquest.api.model.Republic;
import com.repquest.api.model.User;
import com.repquest.api.repository.RepublicRepository;
import com.repquest.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RepublicService {

    private final RepublicRepository repository;
    private final UserRepository userRepository;

    public Republic create(Republic republic, User user){
        republic.setInviteCode(generateUniqueInviteCode());
        Republic savedRepublic = repository.save(republic);

        user.setRepublic(savedRepublic);
        userRepository.save(user);

        return savedRepublic;
    }

    private String generateUniqueInviteCode(){
        String code;
        do {
            code = UUID.randomUUID().toString().substring(0, 6).toUpperCase();
        } while (repository.existsByInviteCode(code));
        return code;
    }

}
