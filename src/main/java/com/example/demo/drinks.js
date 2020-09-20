$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8080/drinks"
    }).then(function(data) {
       $('.drinks-id').append(data.id);
       $('.drinks-content').append(data.content);
    });
});