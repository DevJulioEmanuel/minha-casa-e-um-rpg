package com.repquest.api.repository;

import com.repquest.api.model.Republic;
import com.repquest.api.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.awt.*;
import java.util.Optional;
import java.util.UUID;

@SpringBootTest
public class UserRepositoryTest {

    @Autowired
    UserRepository repository;

    @Autowired
    RepublicRepository republicRepository;

    @Test
    public void salvarTest(){
        User user = new User();
        user.setName("Arthur");
        user.setEmail("teste@gmail.com");
        user.setPassword("Teste");
        user.setColor("#4169E1");

        repository.save(user);
    }

    @Test
    public void salvarUserEEntrarRepublicTest(){
        Republic republic = new Republic();
        republic.setName("Teste123");
        republicRepository.save(republic);

        User user = new User();
        user.setName("Arthur");
        user.setEmail("teste1@gmail.com");
        user.setPassword("Teste");
        user.setColor("#4169E1");
        repository.save(user);

        Republic republic1 = republicRepository.findByInviteCode(republic.getInviteCode()).orElse(null);

        user.setRepublic(republic1);
        repository.save(user);
    }
}
