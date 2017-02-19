class CompanyAlumni extends React.Component {
  constructor(props) {
    super(props)
    this.state = props
  }

  render() {
    return (
      <div className="panel-group">
        <div className="panel panel-default">
          <div className="panel-heading">
            <h3 className="text-center">Employed Alumni</h3>
          </div>
        </div>
        <div className="panel-body">
          <EmployedAlumniTable employees={this.state.employees} />
        </div>
      </div>
    )
  }

}
