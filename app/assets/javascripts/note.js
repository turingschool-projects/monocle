class Note {
  constructor(id, author, title, body, company, isPrivate, createdDate) {
    this.id = id;
    this.author = author;
    this.title = title;
    this.body = body;
    this.company = company;
    this.isPrivate = isPrivate;
    this.createdDate = new FormattedDate(createdDate).date;
  }

  showNote(htmlElement) {
    htmlElement.append(this.noteHTML());
  }

  noteHTML() {
    var html = `<tr id='note-${this.id}'> \'
                  <td><p>${this.company}</p></td> \
                  <td><p>${this.createdDate}</p></td> \
                  <td><p>${this.title}</p></td> \
                  <td><p>${this.body}</p></td> \
                  <td><p>${this.isPrivate}</p></td> \
                  <td class='buttons'></td>
                </tr>`;
    return html;
  }

  addNoteButtons(htmlElement) {
    htmlElement.html(this.noteButtons());
  }

  noteButtons() {
    var html = `<a class="edit-button btn btn-default btn-sm">Edit</span></a> \
                <a class="delete-button btn btn-default btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>`
    return html;
  }

  bindNoteEvents(){
    var self = this;
    $('#notes').on('click', `#note-${this.id} .buttons .delete-button`, function() {
        self.deleteNote();
      });
    $('#notes').on('click', `#note-${this.id} .buttons .edit-button`, function() {
      self.editEvent();
    });
  }

  deleteNote() {
      $.ajax ({
        url: `/notes/${this.id}`,
        type: "DELETE"
      }).then(this.removeNoteHTML)
  }

  editEvent(){
    debugger;
    $(`#note-${this.id}`).children().get(1).attr('contenteditable', true)


    $(`#note-${this.id} .edit-button`).on('click', function(){

      $(`#note-${this.id}`).addClass('edit-box')
      $(`#note-${this.id}`).find('.note-title').attr('contenteditable', true)
      $(`#note-${this.id}`).find('.note-body').attr('contenteditable', true)
      $.when(
        $(`#note-${this.id} .edit-button`).text('Submit changes')
      ).then(
        $(`#note-${this.id} .edit-button`).off()
      ).then(
        $(`#note-${this.id} .edit-button`).on('click', function () {submitChanges(note)})
      )
    });
  }

  removeNoteHTML() {
    $(`#note-${this.id}`).remove()
  }

}
