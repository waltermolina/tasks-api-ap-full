package com.example.tareasapi.repos;

import com.example.tareasapi.models.TaskModel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskRepo extends CrudRepository<TaskModel, Integer> {
    
    
}
