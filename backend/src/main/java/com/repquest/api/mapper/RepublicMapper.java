package com.repquest.api.mapper;

import com.repquest.api.dto.RepublicDTO;
import com.repquest.api.dto.RepublicResponseDTO;
import com.repquest.api.model.Republic;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RepublicMapper {

    Republic toEntity(RepublicDTO republicDTO);

    RepublicDTO toDto(Republic republic);

    RepublicResponseDTO toResponse(Republic republic);
}
