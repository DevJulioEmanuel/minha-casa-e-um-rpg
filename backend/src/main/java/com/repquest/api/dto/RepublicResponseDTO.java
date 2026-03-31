package com.repquest.api.dto;

import java.util.UUID;

public record RepublicResponseDTO (UUID id, String name, String inviteCode) {
}
