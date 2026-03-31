package com.repquest.api.dto;

import java.util.UUID;

public record UserResponseDTO (UUID id, String name, String email, Integer level, Integer currentXp, Integer coinBalance, String color){
}
