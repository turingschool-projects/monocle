$(document).ready(function(){
  displayNotes();
  $("#create-note-button").on('click', prepareNoteCreate);
  $(".star").on("click", prepareStar);
  $(".unstar").on("click", prepareUnstar);
  $(".star-job").on("click", prepareJobStar);
  $(".unstar-job").on("click", prepareJobUnstar);
  $(".size-check-box").on("click", function(){
    $.get('/companies')
  });
  $(".btn-remove").on("click", removeCompany);
  $(".btn-remove-job").on("click", removeJob);
  $("div#industry-options :checkbox").change(filterCompanies);
  $("div#size-options :checkbox").change(toggleSizeSelect);
  $("#size-options").on('change', 'select#sizes', filterCompanies);

  $.when()
  .then(initMap)
  .then(
    $.get('/api/v1/companies')
    .then(addCards)
    .then(centerMap)
  )
});

function renderStar() {
  $('.starred-message').html('');
  $('.star-toggle').html('<span class="glyphicon glyphicon-star"></span> Star');
  $('.star-toggle').removeClass('unstar').addClass('star');
}

function renderUnstar() {
  $('.starred-message').html('<h4><i class="text-info"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> This company has been saved in your starred list.</i></h4>')
  $('.star-toggle').html('<span class="glyphicon glyphicon-star"></span> Unstar');
  $('.star-toggle').removeClass('star').addClass('unstar');
}

function prepareStar() {
  var companyId = $(this).data('id');
  $.ajax({
    url: "/starred_companies",
    method: "POST",
    data: { 'company_id':companyId }
  })
  .done(function(){
    $('.star').off();
  })
  .then(function(){
    renderUnstar();
  })
  .then(function(){
    $(".unstar").on("click", prepareUnstar);
  })
}

function prepareUnstar() {
  var companyId = $(this).data('id');
  $.ajax({
    url: "/starred_companies/" + companyId,
    method: "DELETE"
  })
  .done(function(){
   $(".unstar").off();
  })
  .then(function(){
    renderStar();
  })
  .then(function(){
    $(".star").on("click", prepareStar);
  })
}

function removeCompany() {
  var company = this.closest('.card-holder')
  var id = $(company).data('id')

  $.ajax({
    url: '/starred_companies/' + id,
    type: 'DELETE',
    success: function(){ company.remove() }
  })
}

function removeJob() {
  var job = this.closest('.job')
  var id = $(job).data('id')

  $.ajax({
    url: '/starred_jobs/' + id,
    type: 'DELETE',
    success: function(){ job.remove() }
  })
}

function prepareJobStar() {
  var jobId = $(this).data('id');
  $.ajax({
    url: "/starred_jobs",
    method: "POST",
    data: JSON.parse($('.job-data').text())
  })
  .done(function(){
    $('.star-job').off();
  })
  .then(function(){
    renderJobUnstar();
  })
  .then(function(){
    $(".unstar-job").on("click", prepareJobUnstar);
  })
}

function prepareJobUnstar() {
  var jobId = $(this).data('id');
  $.ajax({
    url: "/starred_jobs/" + jobId,
    method: "DELETE"
  })
  .done(function(){
   $(".unstar-job").off();
  })
  .then(function(){
    renderJobStar();
  })
  .then(function(){
    $(".star-job").on("click", prepareJobStar);
  })
}

function renderJobStar() {
  $('.starred-message').html('');
  $('.star-toggle').html('<span class="glyphicon glyphicon-star"></span> Star');
  $('.star-toggle').removeClass('unstar-job').addClass('star-job');
}

function renderJobUnstar() {
  $('.starred-message').html('<h4><i class="text-info"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> This job has been saved in your starred list.</i></h4>')
  $('.star-toggle').html('<span class="glyphicon glyphicon-star"></span> Unstar');
  $('.star-toggle').removeClass('star-job').addClass('unstar-job');
}

function removeCompany() {
  var company = this.closest('.card-holder')
  var id = $(company).data('id')

  $.ajax({
    url: '/starred_companies/' + id,
    type: 'DELETE',
    success: function(){ company.remove() }
  })
}

function addCards(companies) {
  companies.forEach(function (company, index){
    placeMapMarker(company, index);
    var location = ''
    company['location'].forEach(function(line) {
      location = location + line + '<br>'
    });

    $('#companies-body').append(
      `<div class='card-holder col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>
          <div class='card'>
            <div class='logo'>
              <a href='/companies/${company["id"]}'>
                <img src=${company['logo']}>
              </a>
            </div>
            <div>
              <h4 class='company_name'>
                <a href='/companies/${company["id"]}'>${company.name}</a><br />
              </h4>
              <p>
                ${location}
                <a href='http://${company["website"]}' target='_blank'>
                  ${company['website']}
                </a>
              </p>
            </div>
          </div>
        </div>`
    )
  });
}

function removeCards() {
  $('#companies-body').empty();
}

function toggleSizeSelect() {
  $('#sizes').toggle()
}

function filterCompanies() {
  var filters = getFilters();
  $.when()
  .then(removeCards)
  .then(removeMapMarkers)
  .then(
    $.get('/api/v1/companies', filters)
    .then(addCards)
    .then(centerMap)
  );
}

function getFilters() {
  var filters = {
    company_size: [],
    industry_ids: []
  }
  var convertedSizes = convertCompanySize($('#sizes').val())

    for (var i = 0; i < convertedSizes.length; i++) {
      filters['company_size'].push(convertedSizes[i]);
    }
  $('#industry-options :checked').each(function(index, checkbox) {
    filters['industry_ids'].push($(checkbox).val());
  });

  return filters;
}

function convertCompanySize(dropdownValue) {
  var conversion = {
    "10"  : ["2-10"],
    "50"  : ["2-10","11-50"],
    "100" : ["11-50", "51-200"],
    "200" : ["11-50", "51-200"],
    "500" : ["11-50", "51-200", "201-500"],
    "All" : []
  }
  return conversion[dropdownValue];
}

function placeMapMarker(company, index) {
  this['infowindow' + index] = new google.maps.InfoWindow({
    content: company['name']
  });
  this['marker' + index] = new google.maps.Marker({
    position: JSON.parse(company['coordinates']),
    map: map,
    url: '/companies/' + company['id']
  });

  $(this['marker' + index]).hover(
      function() {
        this['infowindow' + index].open(map, this['marker' + index]);
      }, function() {
        this['infowindow' + index].close();
      }
  );

  $(this['marker' + index]).click(function(){
    window.location.href = '/companies/' + company['id'];
  });

  markers.push(this['marker' + index]);
  bounds.extend(this['marker' + index].getPosition());
}

function initMap() {
  markers = [];
  bounds = new google.maps.LatLngBounds();
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: -39.8282, lng: 98.5795}
  });
}

function removeMapMarkers() {
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];
  bounds = new google.maps.LatLngBounds();
}

function centerMap() {
  map.setCenter(bounds.getCenter());
  map.fitBounds(bounds);
}

function clearFields() {
  $("#create-note-title").val("")
  $("#create-note-body").val("")
}

function prepareNoteCreate(){
    var newNoteTitle = $("#create-note-title");
    var newNoteBody = $("#create-note-body");
    var companyName = $("#create-note-company").val();
    var note = { title: newNoteTitle.val(),
                  body: newNoteBody.val(),
                }

    return $.ajax({
      url: "/api/v1/notes",
      method: "POST",
      data: {note: note, company_name: companyName}
    })
    .done(renderNote)
    .done(clearFields)
    .done(window.location.replace("/notes"))
}

function displayNotes(){
  $.ajax({
    url: "/api/v1/notes",
    method: "GET",
    type: "json"
  })
  .then(createNotes)
}

function createNotes(raw) {
  for (var i = 0; i < raw.length; i++) {
    var note = new Note(
      raw[i].id,
      raw[i].author,
      raw[i].title,
      raw[i].body,
      raw[i].company_id,
      raw[i].status,
      raw[i].created_at
    );
    note.showNote($('#notes'));
    note.addNoteButtons($('.buttons'));
    note.bindNoteEvents();
  }
}
