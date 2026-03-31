package com.repquest.api.validator;

import com.repquest.api.exceptions.RegistroDuplicadoException;
import com.repquest.api.model.User;
import com.repquest.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UserValidator {

    private final UserRepository repository;

    public void validate(User user){
        if(existsUser(user)){
            throw new RegistroDuplicadoException("Autor já cadastrado");
        }
    }

    private boolean existsUser(User user){
        Optional<User> userFound = repository.findByEmail(user.getEmail());

        if(user.getId() == null){
            return userFound.isPresent();
        }

        return userFound.isPresent() && !user.getId().equals(userFound.get().getId());
    }
}
