var baseurl = "http://127.0.0.1:8080/drinks";
function loadDrinks(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", baseurl, true);
        if(xmlhttp.readyState ===4 && xmlhttp.status===200){
            var drinks = JSON.parse(xmlhttp.responseText);
            var tbltop = `<tr><th>Id</th> <th>Name</th> <th>Sort</th> <th>Abv</th></tr>`;
//            main table will fill with data from the endpoint
        var main = "";
            for (i = 0; i < drinks.length; i++) {
                main += "<tr><td>"+drinks[i].id+"</td><td>"+drinks[i].name+"</td><td>"+drinks[i].sort+"</td><td>"+drinks[i].abv+"</td></tr>";
            }
            var tblbottom = "</table>";
            var tbl = tbltop + main + tblbottom;
            document.getElementById("drinksinfo").innerHTML = tbl;
        }
        xmlhttp.send();
};

window.onload = function(){
    loadDrinks();
}