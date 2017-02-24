class CompanyAlumni extends React.Component {
  constructor(props) {
    super(props)
    this.state = props
  }

  componentDidMount() {
    this.addPlusSign()
    this.getAllCensusUsers()
  }

  addPlusSign() {
    if (this.state.currentUser.role == 'admin') {
      document.getElementById('add-plus').style.display = "inline"
    }
    else {
      document.getElementById('add-plus').style.display = "none"
    }
  }

  employeeForm() {
    this.setState( {showAdminForm: true} )
  }

  handleSubmit() {
    debugger;
    let company_id = window.location.pathname.split('/')[window.location.pathname.split('/').length - 1]
    axios.post( `/api/v1/companies/${company_id}/admin/employees`, { name: this.state.name } )
  }

  createEmployee() {
    let company_id = window.location.pathname.split('/')[window.location.pathname.split('/').length - 1]
    let employeesState = this.state.employees
    axios.post(`/api/v1/companies/${company_id}/employees`)
    .then((returned) => {
      employeesState.push(returned.data)
      this.setState({ employees: employeesState }, this.determineDisable.bind(this, employeesState, this.state.currentUser))
    })
  }

  determineDisable(employees, currentUser) {
    if (employees.length == 0) {
      return this.setState({ workHereDisabled: false })
    }
    for (var i = 0; i < employees.length; i++) {
      if (employees[i].user_id == currentUser.id) {
        return this.setState({ workHereDisabled: true })
      }
      else {
        this.setState({ workHereDisabled: false })
      }
    }
  }

  getAllCensusUsers() {
    axios.get('/api/v1/admin/census_users')
    .then((returned) => {
      this.setState({ census: returned.data })
    })
  }

  createDataList() {
    let dataList = document.getElementById('matches-datalist')
    this.state.censusUsers.forEach((match) => {
      let option = document.createElement('option')
      option.value = match.name
      dataList.appendChild(option)
    })
  }

  render() {
    return (
        <div className="panel panel-default">
          <div className="panel-heading">
            <h3 className="text-center">Employed Alumni
              <span id="add-plus">
                <a id="plus-sign" onClick={this.employeeForm.bind(this)}>[+]</a>
              </span>
              <span>
                <WorkHereButton buttonDisabled={this.state.workHereDisabled}
                  createEmployee={this.createEmployee.bind(this)}/>
              </span>
            </h3>
            <EmployeeForm showComponent={this.state.showAdminForm}
              createEmployee={this.handleSubmit}
              censusUsers={this.state.census}
              createDataList={this.createDataList.bind(this)} />
          </div>
        <div className="panel-body">
          <EmployedAlumniTable employees={this.state.employees}
            currentUser={this.state.current_user}
            determineDisable={this.determineDisable.bind(this)} />
        </div>
      </div>
    )
  }

}
