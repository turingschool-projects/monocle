class EmployeeRow extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.companyName}</td>
        <td>{this.props.username}</td>
        <td><button onClick={this.props.removeEmployee}>❌</button></td>
      </tr>
    )
  }
}
