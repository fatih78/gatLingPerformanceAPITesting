#Code en Running your SpringBoot Application
Run your application with class 'DemoApplication'
Class 'Drink' contains the entities you're about to creat
Interface 'RestRepository' is needed for any CRUD operations for the partical table!

#Properties
Property below means that this is a memory Database, you need to start your applicatin firstly!
spring.datasouce.url=jdbc:h2:mem:drinks

#Viewing JSON Data from browser
Navigate to url below and see your JSON data:
http://localhost:8080/drinks

Navigate to url below to CRUD your data from this url
http://localhost:8080/explorer/index.html#uri=/

#Remarks
One annotation is able to create an whole entire API '@RepositoryRestResource'


#TestCases
## LocalTunnel
Quickstart
Install Localtunnel globally (requires NodeJS) to make it accessible anywhere:
    npm install -g localtunnel
    
Start a webserver on some local port (eg http://localhost:8000) and use the command line interface to request a tunnel to your local server:
    lt --port 8080


