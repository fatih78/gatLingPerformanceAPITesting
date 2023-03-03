# Code en Running your SpringBoot Application

Run your application with class 'DemoApplication'
Class 'Drink' contains the entities you're about to create
Interface 'RestRepository' is needed for any CRUD operations for the partical table!

# Properties

Property below means that this is a memory Database, you need to start your applicatin first!
spring.datasouce.url=jdbc:h2:mem:drinks

# Viewing JSON Data from browser

Navigate to url below and see your JSON data:
http://localhost:8080/drinks

Navigate to url below to CRUD your data from this url
http://localhost:8080/explorer/index.html#uri=/

# Remarks

One annotation is able to create an whole entire API '@RepositoryRestResource'


# TestCases

See class 'DemoApplicationTests' for the unit tests

# Starting UP End-Point
Use Java class below to start-up the endpoint & visit after that: http://localhost:8080/drinks
DemoApplication.java 


# CommandLine from root directory
./gradlew bootRun >> does not work for now (use 'DemoApplication.java')
./gradlew test

# PortCommands
lsof -n -i4TCP:8000 (portnumber)
kill -9 68453 (number is PID value from the list-command above)

