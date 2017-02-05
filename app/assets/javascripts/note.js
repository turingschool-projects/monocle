class Note {
  constructor(id, author, title, body, company, isPrivate, createdDate) {
    this.id = id;
    this.author = author;
    this.title = title;
    this.body = body;
    this.company = company;
    this.isPrivate = isPrivate;
    this.createdDate = createdDate;
  }

  showNote(htmlElement) {
    htmlElement.append(this.noteHTML());
  }

  noteHTML() {
    var html = `<tr class='note-${this.id}'> \'
                  <td><p>${this.company}</p></td> \
                  <td><p>${this.formattedDate(this.createdDate)}</p></td> \
                  <td><p>${this.title}</p></td> \
                  <td><p>${this.body}</p></td> \
                  <td><p>${this.isPrivate}</p></td> \
                  <td class='buttons'></td>
                </tr>`;
    return html;
  }

  addNoteButtons(htmlElement) {
    debugger;
    htmlElement.html(this.noteButtons());
  }

  noteButtons() {
    var html = `<a class="edit-button btn btn-default btn-sm">Edit</span></a> \
                <a class="delete-button btn btn-default btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>`
    return html;
  }

  formattedDate(date){
    var date = new Date(date)
    var dd = date.getDate();
    var mm = date.getMonth()+1;
    var yyyy = date.getFullYear();

    if(dd < 10) {
      dd = '0' + dd;
    }

    if(mm < 10) {
      mm = '0' + mm;
    }

    var today = mm + '/' + dd + '/' + yyyy;
    return today;
  }
}
