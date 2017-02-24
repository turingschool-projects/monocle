class EmployeeRow extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.companyName}</td>
        <td>{this.props.firstName}</td>
        <td>{this.props.lastName}</td>
        <td>{this.props.slack}</td>
        <td>{this.props.email}</td>
        <td><a className='remove-employee' onClick={this.props.removeEmployee}>❌</a></td>
      </tr>
    )
  }
}
