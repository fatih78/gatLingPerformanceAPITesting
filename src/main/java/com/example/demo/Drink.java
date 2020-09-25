package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

// tells that this is an entity that maps to a database
@Entity
public class Drink {


    @Id// Id for the record level
    @GeneratedValue(strategy = GenerationType.IDENTITY) // since we don't want to generate the Id by ourself!

    //    drinks will contain three properties:
    private long Id;
    private String name;
    private String sort;
    private double abv;

    public String getSort() { return sort; }
    public void setSort(String sort) { this.sort = sort; }

    public void setId(long id) {
        Id = id;
    }
    public long getId() {
        return Id;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }

    public void setAbv(double abv) {
        this.abv = abv;
    }
    public double getAbv() {
        return abv;
    }


}
