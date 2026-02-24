package com.repquest.api.dto;

import com.repquest.api.model.TaskStatus;

import java.time.LocalDate;

public record TaskResponseDTO(String title, LocalDate dueDate, TaskStatus status, Integer xpReward, Integer rewardCoins) {
}
