class EmployeeRow extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.companyName}</td>
        <td>{this.props.username}</td>
        <td><a className='remove-employee' onClick={this.props.removeEmployee}>❌</a></td>
      </tr>
    )
  }
}
