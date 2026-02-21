package com.repquest.api.repository;

import com.repquest.api.model.Republic;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface RepublicRepository extends JpaRepository<Republic, UUID> {

    Optional<Republic> findByInviteCode(String invitecode);

    boolean existsByInviteCode(String invitecode);
}
