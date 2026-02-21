package com.repquest.api.repository;

import com.repquest.api.model.Republic;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RepublicRepositoryTest {

    @Autowired
    RepublicRepository repository;

    @Test
    public void salvarTest(){
        Republic republic = new Republic();
        republic.setName("Teste");
        republic.setInviteCode("ABCDEFG");

        Republic republicSalva = repository.save(republic);
        System.out.println("Republica Salva: " + republicSalva);
    }

}
