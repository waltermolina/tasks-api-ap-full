package com.example.tareasapi.controllers;

//import java.util.ArrayList;
import java.util.List;

import com.example.tareasapi.models.TaskModel;
import com.example.tareasapi.services.TaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @Autowired
    private TaskService taskService;

    @GetMapping
    public List<TaskModel> findAllTasks() {
        return taskService.getAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<TaskModel> findTaskById(@PathVariable(value = "id") int id) {
        return taskService.getById(id);
    }

    @PostMapping
    public TaskModel saveTask(@Validated @RequestBody TaskModel task) {
        return taskService.save(task);
    }

    @PutMapping("/{id}") //put facil
    public TaskModel updateTask(@Validated @RequestBody TaskModel task) {
        return taskService.save(task);
    }


    @PutMapping("/dificil/{id}") //put dificil
    public ResponseEntity<TaskModel> updateTaskDificil(@PathVariable(value = "id") int id, @Validated @RequestBody TaskModel task) {
        if (id == task.idtask) {
            TaskModel taskNew = taskService.save(task);
            return ResponseEntity.ok().body(taskNew);
        } else {
            return ResponseEntity.badRequest().build();
        }
    }



}
