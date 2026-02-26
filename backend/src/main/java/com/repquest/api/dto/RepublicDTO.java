package com.repquest.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RepublicDTO(@NotBlank(message = "Campo obrigatório") @Size(max = 20, message = "Deve ter no máximo 20 caracteres") String name) {
}
