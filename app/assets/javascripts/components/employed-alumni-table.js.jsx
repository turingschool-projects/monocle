class EmployedAlumniTable extends React.Component {
  constructor(props) {
    super(props)
    this.state = props
  }

  deleteEmployee(deletedEmployee) {
    axios.delete(`/api/v1/companies/${deletedEmployee.company_id}/employees/${deletedEmployee.id}`)
    .then(() => {
      let employeeList = this.state.employees.filter((employee) => {
        return employee.id !== deletedEmployee.id
      })
      this.setState( {employees: employeeList}, this.handleOnClickRemove.bind(this, employeeList) )
    })
  }

  handleOnClickRemove(employees) {
    this.props.determineDisable(employees, this.state.currentUser)
  }

    render () {
    let employees = this.state.employees.map((employee) => {
      return (<EmployeeRow
        key={employee.id}
        companyName={employee.company_name}
        firstName={employee.first_name}
        lastName={employee.last_name}
        slack={employee.slack}
        email={employee.email}
        removeEmployee={this.deleteEmployee.bind(this, employee)}
        determineDisable={this.props.determineDisable} />
      )
    })

    return (
      <table className="table" >
        <thead>
          <tr>
            <th>Company</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Slack Handle</th>
            <th>Email</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {employees}
        </tbody>
      </table>
    )
  }
}
