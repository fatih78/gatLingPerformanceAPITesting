package com.example.demo;

import org.springframework.web.bind.annotation.*;

@RestController
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
