var StarredCompanies = React.createClass({

  render: function() {
      return (
        <div class='card-holder col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-2'>
          <CompanyList companies={ this.props.companies } />
        </div>
      )
  }
});

const CompanyList = ({companies}) => {
  return(
    <div>
      { companies.map( company => <Company {...company} />) }
    </div>
    )
};

const Company = ({ name, website, products_services, headquarters }) => {
  return(
    <div className='CompanyCard'>
      <h3> { name } </h3>
      <p> { website } </p>
      <p> { products_services } </p>
      <p> { headquarters } </p>
    </div>
  )
}
