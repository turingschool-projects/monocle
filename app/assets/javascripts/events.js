$(document).ready(function(){
  $("#star").on("click", function(){
    console.log("button pressed")
    var companyId = $(this).data('id');
    return $.ajax({
      url: "/starred_companies?company=" + companyId,
      method: "POST"
    })
    .done(function(){
      console.log("returned successful")
      $("#star").remove();
      $("table").after('<h4><i class="text-info"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> This company has been saved in your starred list.</i></h4>');
    })
  });
});
