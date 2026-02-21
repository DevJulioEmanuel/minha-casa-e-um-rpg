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
    public void entrarRepublicTest(){
        var id  = UUID.fromString("e65c8f54-bb3b-4173-8bc0-1c5119387785");
        Optional<User> user = repository.findById(id);

        if(user.isPresent()){
            User userEncontrado = user.get();
            Optional<Republic> republic = republicRepository.findByInviteCode("ABCDEFG");
            userEncontrado.setRepublic(republic.get());
            repository.save(userEncontrado);
        }

        System.out.println(user.toString());

    }
}
