package com.example.demo;


import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableAutoConfiguration()
@RequestMapping("/drinks")
public class DrinksController {

    @GetMapping("/drinks/{id}")
    public long getDrinkId(@PathVariable("id") Drink dr){
        return dr.getId();
    }

    @GetMapping("/drinks/{name}")
    public String getDrink(@PathVariable("name") Drink dr) {
        return dr.getName();
    }
}
