package com.repquest.api.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "item")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    private ItemCategory category;

    @Column(name = "prince_coins",nullable = false)
    private Integer priceCoins;

    @Column(name = "min_level", nullable = false)
    private Integer minLevel;

    @Column(name = "asset_url")
    private String assetUrl;
}
