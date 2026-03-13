package com.repquest.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record AuthenticationRequestDTO(
        @NotBlank(message = "Campo obrigatório")
        @Email(message = "Insira um email válido")
        String email,
        @NotBlank(message = "Campo obrigatório")
        String password
) { }
