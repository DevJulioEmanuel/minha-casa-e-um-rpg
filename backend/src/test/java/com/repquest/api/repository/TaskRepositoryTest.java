package com.repquest.api.repository;

import com.repquest.api.model.Republic;
import com.repquest.api.model.Task;
import com.repquest.api.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;

@SpringBootTest
public class TaskRepositoryTest {

    @Autowired
    TaskRepository repository;

    @Autowired
    RepublicRepository republicRepository;

    @Autowired
    UserRepository userRepository;

    @Test
    public void CriarTaskEComUsuarioJaVinculado(){
        Republic republic = new Republic();
        republic.setName("Teste123");
        republicRepository.save(republic);

        User user = new User();
        user.setName("Lelis");
        user.setEmail("teste123@gmail.com");
        user.setPassword("Teste");
        user.setColor("#4169E1");
        userRepository.save(user);

        Republic republic1 = republicRepository.findByInviteCode(republic.getInviteCode()).orElse(null);

        user.setRepublic(republic1);
        userRepository.save(user);

        Task task = new Task();
        task.setTitle("Lavar a casa");
        task.setRepublic(republic);
        task.setAssignedUser(user);
        task.setXpReward(100);
        task.setRewardCoins(10);
        task.setDueDate(LocalDate.of(2026, 2, 22));

        repository.save(task);
    }

}
