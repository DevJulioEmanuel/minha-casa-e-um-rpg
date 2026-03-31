package com.repquest.api.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UserDTO (@NotBlank(message = "Campo obrigatório") @Email(message = "Insira um e-mail válido") String email, @NotBlank(message = "Campo obrigatório") @Size(min = 6, message = "No mínimo 6 caracteres") String password) {
}
