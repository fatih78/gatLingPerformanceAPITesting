// This interface is needed for any CRUD operations for the partical table!

package com.example.demo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource //this annotation will create the rest API
public interface RestRepository extends CrudRepository<Drink,Long> {
}
