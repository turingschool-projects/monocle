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
      this.setState( {employees: employeeList} )
    })
  }

    render () {
    let employees = this.state.employees.map((employee) => {
      return (<EmployeeRow
        key={employee.id}
        username={employee.username}
        companyName={employee.company_name}
        removeEmployee={this.deleteEmployee.bind(this, employee)} />
      )
    })

    return (
      <table className="table">
        <thead>
          <tr>
            <th>Company</th>
            <th>Employee</th>
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
