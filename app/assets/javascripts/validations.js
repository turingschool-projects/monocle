$(document).ready( function(){
  $("#create-company").on('click', checkCompanyFields);

});

function checkCompanyFields(event) {
    var x, text;

    // Get the value of the input field with id="numb"
    x = document.getElementById("location_street_address").value;

    if (x == "") {
        text = "Input not valid";
        document.getElementById("demo").innerHTML = text;
        event.preventDefault()
    }
};
