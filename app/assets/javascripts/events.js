$(document).on('turbolinks:load', function(){
  var companies = 

  $(".star").on("click", prepareStar);
  $(".unstar").on("click", prepareUnstar);
  $(".size-check-box").on("click", function(){
    $.get('/companies')
  });
  $(".btn-remove").on("click", removeCompany);
  $(":checkbox").change(filterCompanies);
  $.get('/api/v1/companies')
  .then(addCards)
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

function addCards(companies) {
  companies.forEach(function (company){
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

function filterCompanies() {
  $.get('/api/v1/companies', {
      company_size: $(this).val()
    }
  ).then(addCards);
}
