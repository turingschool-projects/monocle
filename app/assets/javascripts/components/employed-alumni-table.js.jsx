class EmployedAlumniTable extends React.Component {
  constructor(props) {
    super(props)
    this.state = props
  }

  deleteEmployee(id) {
    let employeeList = this.state.employees.filter((employee) => {
      return employee.id !== id
    })
    this.setState( {employees: employeeList} )
    axios.delete(`/api/v1/companies/${employee.company_id}`)
  }

    render () {
    let employees = this.state.employees.map((employee) => {
      return (<EmployeeRow
        key={employee.id}
        username={employee.username}
        companyName={employee.company_name}
        removeEmployee={this.deleteRow.bind(this, employee.company_id)} />
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
