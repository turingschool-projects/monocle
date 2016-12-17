$(document).ready(function(){
  displayNotes();

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

  $("#create-note-button").on('click', function(){
    var newNoteTitle = $("#create-note-title");
    var newNoteBody = $("#create-note-body");
    var user_id = $('#create-note-button').data('userId')
    var company_id = $('#create-note-button').data('companyId')
    var note = { title: newNoteTitle.val(),
                         body: newNoteBody.val(),
                         user_id: user_id,
                         company_id: company_id}
    return $.ajax({
      url: "/companies/" + company_id + "/notes",
      method: "POST",
      data: {note: note}
    })
    .done(renderNote(note))
  });
});

function displayNotes(){
  var company_id = $('#create-note-button').data('companyId')
  $.ajax({
    url: "/api/v1/notes",
    method: "GET",
    data: {id: company_id},
    type: "json"
  })
  .then(function(rawNotes){
    rawNotes.forEach(renderNote)
  })
}

function renderNote(note){
  $('#notes').prepend(
    `<div class='note-block panel panel-default'>
      <div class='panel-body small'>
        <div class='pull-left'>
          <h6>Author: ${note.user_id}</h6>
          <h6>Title: ${note.title}</h6>
          <h6>Note: ${note.body}</h6>
        </div>
      </div>
    </div> `
)}
