package com.repquest.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record UserDTO (@NotBlank(message = "Campo obrigatório") @Email(message = "Insira um e-mail válido") String email, @NotBlank(message = "Campo obrigatório") String password) {
}
