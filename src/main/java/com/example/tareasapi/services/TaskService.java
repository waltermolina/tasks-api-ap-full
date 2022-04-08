package com.example.tareasapi.services;

import java.util.List;
import java.util.Optional;

import com.example.tareasapi.models.TaskModel;
import com.example.tareasapi.repos.TaskRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class TaskService {
    @Autowired
    TaskRepo taskRepo;

    public List<TaskModel> getAll(){
        return (List<TaskModel>) taskRepo.findAll();
    }

    public ResponseEntity<TaskModel> getById(int id) {

        Optional<TaskModel> task = taskRepo.findById(id);

        if (task.isPresent()) {
            return ResponseEntity.ok().body(task.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    public TaskModel save(TaskModel task) {
        return taskRepo.save(task); // crea o actualiza
    }
}
