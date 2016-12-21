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
  debugger
  var username = $('#create-note-button').data('username')
  var userId = $('#create-note-button').data('userId')
  var company_id = $('#create-note-button').data('companyId')
  if (userId == note.user_id) {
  $('#notes').append(
      `<div class='note-block panel panel-default'>
      <div class='panel-body small'>
      <div class='btn-group pull-right'>
      <a href="/companies/${company_id}/notes/${note.id}/edit" class="edit-button btn btn-default btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
       <a href="/companies/notes/delete?company_id=${company_id}&note_id=${note.id}" class="delete-button btn btn-default btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
       </div>
        <div class='pull-left'>
          <h6>Author: ${username}</h6>
          <h6>Title: ${note.title}</h6>
          <h6>Note: ${note.body}</h6>
        </div>
      </div>
    </div> `)} else {
      $('#notes').append(
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
}
