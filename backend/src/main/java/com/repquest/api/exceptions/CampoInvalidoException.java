package com.repquest.api.exceptions;

import lombok.Getter;

public class CampoInvalidoException extends RuntimeException {

    @Getter
    private String campo;

    public CampoInvalidoException(String message){
        super(message);
        this.campo = campo;
    }
}
