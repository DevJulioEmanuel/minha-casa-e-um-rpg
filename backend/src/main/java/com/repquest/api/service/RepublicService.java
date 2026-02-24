package com.repquest.api.service;

import com.repquest.api.model.Republic;
import com.repquest.api.repository.RepublicRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RepublicService {

    private final RepublicRepository repository;

    public Republic save(Republic republic){
        return repository.save(republic);
    }

}
