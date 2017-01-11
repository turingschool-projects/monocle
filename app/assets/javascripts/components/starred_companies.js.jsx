var StarredCompanies = React.createClass({
  getInitialState() {
    return{ companies: [] }
  },

  componentDidMount() {
    $.getJSON('/starred_companies', (response)=> { this.setState({companies: response}) });
  },

  render: function() {
    var starred_companies = this.state.companies.map(company) => {
      return (
        <div class='card-holder col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>
          <div class='card'>
            <div class='logo'>
             <h1>{company.name}</h1>
            </div>
            <div>
              <h4 class="company_name">
              </h4>
              <p>
              </p>
            </div>
          </div>
        </div>
      )
    }
  }
});

var CompanyCard = React.createClass({
  render: function() {
    )
  }
});
