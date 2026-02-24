package com.repquest.api.dto;

import com.repquest.api.model.TaskDifficulty;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;
import java.util.UUID;

public record TaskDTO (@NotBlank(message = "Campo obrigatório") String title, @NotNull(message = "Campo obrigatório") @FutureOrPresent(message = "A data dever ser hoje ou futura") LocalDate dueDate, @NotNull(message = "Campo obrigatório") TaskDifficulty difficulty, @NotNull(message = "Campo obrigatório") UUID userId) {
}
