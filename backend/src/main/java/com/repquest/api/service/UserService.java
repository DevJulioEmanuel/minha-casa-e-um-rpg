package com.repquest.api.service;

import com.repquest.api.dto.UserAvatarDTO;
import com.repquest.api.exceptions.RegistroDuplicadoException;
import com.repquest.api.exceptions.RegistroNaoEncontradoException;
import com.repquest.api.model.Republic;
import com.repquest.api.model.User;
import com.repquest.api.repository.RepublicRepository;
import com.repquest.api.repository.UserRepository;
import com.repquest.api.validator.UserValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;
    private final RepublicRepository republicRepository;
    private final UserValidator validator;
    private final PasswordEncoder passwordEncoder;

    public User save(User user){
        validator.validate(user);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return repository.save(user);
    }

    public User completedProfile(User user, UserAvatarDTO dto){
        user.setName(dto.name());
        user.setAvatar(dto.avatar());
        user.setColor(dto.color());

        return repository.save(user);
    }

    public User joinRepublic(User user, String inviteCode){
        if (user.getRepublic() != null) {
            throw new RegistroDuplicadoException("Usuário já pertence a uma república");
        }

        Republic republic = republicRepository.findByInviteCode(inviteCode).orElseThrow(() -> new RegistroNaoEncontradoException("Código de convite invalido"));

        user.setRepublic(republic);
        return repository.save(user);
    }
}
