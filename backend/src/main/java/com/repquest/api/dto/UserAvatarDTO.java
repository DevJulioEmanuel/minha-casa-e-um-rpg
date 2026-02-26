package com.repquest.api.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UserAvatarDTO(@NotBlank(message = "Campo obrigatório") @Size(max = 20, message = "No máximo 20 caracteres") String name, @NotBlank(message = "Campo obrigatório") String avatar, @NotBlank(message = "Campo obrigatório") String color) {
}
