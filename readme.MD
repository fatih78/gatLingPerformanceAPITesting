#Code en Running your SpringBoot Application
Run your application with class 'DemoApplication'
Class 'Drink' contains the entities you're about to create
Interface 'RestRepository' is needed for any CRUD operations for the partical table!

#Properties
Property below means that this is a memory Database, you need to start your applicatin first!
spring.datasouce.url=jdbc:h2:mem:drinks

#Viewing JSON Data from browser
Navigate to url below and see your JSON data:
http://localhost:8080/drinks

Navigate to url below to CRUD your data from this url
http://localhost:8080/explorer/index.html#uri=/

#Remarks
One annotation is able to create an whole entire API '@RepositoryRestResource'


#TestCases
See class 'DemoApplicationTests' for the unit tests

# Used Libraries:
restTemplate
restAssured
mockMvc


