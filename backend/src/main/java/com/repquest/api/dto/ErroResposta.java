package com.repquest.api.dto;

import org.springframework.http.HttpStatus;

import java.util.List;

public record ErroResposta (int status, String message, List<ErroCampo> erros){

    public static ErroResposta conflict(String message){
        return new ErroResposta(HttpStatus.CONFLICT.value(), message, List.of());
    }

    public static ErroResposta notFound(String message){
        return new ErroResposta(HttpStatus.NOT_FOUND.value(), message, List.of());
    }
}
