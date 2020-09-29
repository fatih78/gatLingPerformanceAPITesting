$(document).ready(function() {
    $.ajax(
    {headers:{
        "Access-Control-Allow-Origin": "*/*",
        "Accept": "*/*"
        },
     url: "http://127.0.0.1:8080/drinks/"
    }
    ).then(function(data) {
       $('.drinks-id').append(data.id);
       $('.drinks-content').append(data.content);
    });
});
