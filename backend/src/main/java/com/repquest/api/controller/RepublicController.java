package com.repquest.api.controller;

import com.repquest.api.dto.RepublicDTO;
import com.repquest.api.dto.RepublicResponseDTO;
import com.repquest.api.mapper.RepublicMapper;
import com.repquest.api.model.Republic;
import com.repquest.api.service.RepublicService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;

@RestController
@RequestMapping("republic")
@RequiredArgsConstructor
public class RepublicController implements GenericController{

    private final RepublicService service;
    private final RepublicMapper mapper;

    @PostMapping
    public ResponseEntity<RepublicResponseDTO> create(@RequestBody @Valid RepublicDTO republicDTO){
        Republic republic = mapper.toEntity(republicDTO);
        service.create(republic);
        URI location = gerarHeaderLocation(republic.getId());
        return ResponseEntity.created(location).build();
    }
}
