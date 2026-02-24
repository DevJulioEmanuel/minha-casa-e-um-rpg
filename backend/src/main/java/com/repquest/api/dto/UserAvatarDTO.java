package com.repquest.api.dto;

import jakarta.validation.constraints.NotBlank;

public record UserAvatarDTO(@NotBlank(message = "Campo obrigatório") String name, @NotBlank(message = "Campo obrigatório") String avatar, @NotBlank(message = "Campo obrigatório") String color) {
}
