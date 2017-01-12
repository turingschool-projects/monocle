var StarredCompanies = React.createClass({

  render: function() {
      return (
        <div class='card-holder col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>
          <CompanyList companies={ this.props.companies } remove={ this.removeStarredCompany.bind(this) } />
        </div>
      )
  },

  removeStarredCompany(id){
    this.props.companies = this.props.companies.filter(function(company) {
      return company.id !== id
    })
  }

});

const CompanyList = ({companies, remove}) => {
  return(
    <div>
      { companies.map( company => <Company {...company} remove={ remove } />) }
    </div>
    )
};

const Company = ({ name, website, products_services, headquarters, id, remove }) => {
  return(
    <div className='CompanyCard'>
      <h3> { name } </h3>
      <p> { website } </p>
      <p> { products_services } </p>
      <p> { headquarters } </p>
      <button onClick={()=> remove(id)}>Remove Starred Company</button>
    </div>
  )
}
