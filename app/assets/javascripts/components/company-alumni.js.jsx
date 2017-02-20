class CompanyAlumni extends React.Component {
  constructor(props) {
    super(props)
    this.state = props
  }

  componentDidMount() {
    this.addPlusSign()
  }

  addPlusSign() {
    if (this.state.role == 'admin') {
      document.getElementById('add-plus').style.display = "inline"
    }
    else {
      document.getElementById('add-plus').style.display = "none"
    }
  }

  employeeForm() {
    this.setState( {showAdminForm: true} )
  }

  handleSubmit(event) {
    event.preventDefault()
    let company_id = window.location.pathname[window.location.pathname.length - 1]
    axios.post( `/api/v1/companies/${company_id}/admin/employees`, {
        first_name: this.state.firstName,
        last_name: this.state.lastName
      }
    )
  }

  render() {
    return (
      <div className="panel-group">
        <div className="panel panel-default">
          <div className="panel-heading">
            <h3 className="text-center">Employed Alumni
              <span id="add-plus">
                <a id="plus-sign" onClick={this.employeeForm.bind(this)}>[+]</a>
              </span>
            </h3>
            <EmployeeForm showComponent={this.state.showAdminForm}
              createEmployee={this.handleSubmit} />
          </div>
        </div>
        <div className="panel-body">
          <EmployedAlumniTable employees={this.state.employees} />
        </div>
      </div>
    )
  }

}
