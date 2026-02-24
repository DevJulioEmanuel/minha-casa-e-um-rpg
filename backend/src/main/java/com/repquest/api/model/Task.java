package com.repquest.api.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "task")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(length = 200, nullable = false)
    private String title;

    @Column(name = "xp_reward", nullable = false)
    private Integer xpReward = 0;

    @Column(name = "reward_coins", nullable = false)
    private Integer rewardCoins = 0;

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    private TaskStatus status = TaskStatus.OPEN;

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    private TaskDifficulty difficulty;

    @Column(name = "due_date", nullable = false)
    private LocalDate dueDate;

    @ManyToOne
    @JoinColumn(name = "republic_id")
    private Republic republic;

    @ManyToOne
    @JoinColumn(name = "assigned_user_id", nullable = true)
    private User assignedUser;
}
