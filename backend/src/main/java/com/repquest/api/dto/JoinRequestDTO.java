package com.repquest.api.dto;

import jakarta.validation.constraints.NotBlank;

public record JoinRequestDTO(@NotBlank(message = "Campo obrigatório") String inviteCode) {
}
