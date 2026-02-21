package com.repquest.api.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "tb_user")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(length = 20, nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "current_xp")
    private Integer currentXp = 0;

    @Column(name = "level")
    private Integer level = 1;

    @Column(name = "coin_balance")
    private Integer coinBalance = 0;

    @Column(name = "color")
    private String color;

    @ManyToOne
    @JoinColumn(name = "republic_id")
    private Republic republic;

    @OneToMany(mappedBy = "assignedUser")
    private List<Task> tasks;
}
