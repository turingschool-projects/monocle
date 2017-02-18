class EmployedAlumniTable extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    let employees = this.props.employees.map((employee) => {
      return (<EmployeeRow
        key={employee.id}
        username={employee.username}
        companyName={employee.company_name} />
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
