package com.repquest.api.repository;

import com.repquest.api.model.BillSplit;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface BillSplitRepository extends JpaRepository<BillSplit, UUID> {
}
