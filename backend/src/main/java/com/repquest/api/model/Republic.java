package com.repquest.api.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "republic", schema = "public")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Republic {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "name", nullable = false, length = 20)
    private String name;

    @Column(name = "invite_code", nullable = false, unique = true)
    private String inviteCode;

    @OneToMany(mappedBy = "republic")
    private List<User> users;

    @OneToMany(mappedBy = "republic")
    private List<Task> tasks;

    @PrePersist
    public void generateInviteCode() {
        if (this.inviteCode == null) {
            this.inviteCode = java.util.UUID.randomUUID().toString()
                    .substring(0, 6).toUpperCase();
        }
    }
}
