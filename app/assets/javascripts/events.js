$(document).ready(function(){
  $("#star").on("click", function(){
    var companyId = $(this).data('id');
    return $.ajax({
      url: "/starred_companies?company=" + companyId,
      method: "POST"
    })
    .done(function(){
      $("#star").remove();
      $("table").after('<h4><i class="text-info"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> This company has been saved in your starred list.</i></h4>');
    })
  });
});
