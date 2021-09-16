package com.example.demo;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AnimalController {

    private final AnimalRepository animalRepository;
    public AnimalController(AnimalRepository animalRepository, ObjectMapper objectMapper) {
        this.animalRepository = animalRepository;

    }

    @GetMapping(value = "/")
    public String index(Model model) throws Exception {

        List<Animal> list = animalRepository.findAll();
        model.addAttribute("animals", list);

        return "ui/index";
    }
}
