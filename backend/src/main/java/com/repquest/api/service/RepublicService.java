package com.repquest.api.service;

import com.repquest.api.model.Republic;
import com.repquest.api.repository.RepublicRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RepublicService {

    private final RepublicRepository repository;

    public Republic create(Republic republic){
        republic.setInviteCode(generateUniqueInviteCode());

        return repository.save(republic);
    }

    private String generateUniqueInviteCode(){
        String code;
        boolean exists;
        do {
            code = UUID.randomUUID().toString().substring(0, 6).toUpperCase();
            exists = repository.existsByInviteCode(code);
        } while (exists);
        return code;
    }

}
