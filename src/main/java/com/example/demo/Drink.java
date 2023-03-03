package com.example.demo;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;

// tells that this is an entity that maps to a database
@Entity
public class Drink {


//    @Id// Id for the record level
////    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    // Be aware! Enabling code above makes Id's auto generated! We don't want that in our case because of our 'karateCREATE.feature'
//    // Drinks will contain three properties:

    @jakarta.persistence.Id
    @Column(name = "id", nullable = false)
    private Long id;
    private String origin;
    private String name;
    private String sort;
    private double abv;
    private String email;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

//    public void setId(long id) {Id = id;}
//    public long getId() {return Id;}

    public void setName(String name) {this.name = name;}
    public String getName() {return name.replace("\"", "");}

    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {return email;}

    public void setSort(String sort) {
        this.sort = sort;
    }
    public String getSort() {
        return sort;
    }

    public void setCountry(String country) {
        this.origin = origin;
    }
    public String getCountry() {
        return origin;
    }

    public void setAbv(int abv) {
        this.abv = abv;
    }
    public double getAbv() {return abv;}
}
