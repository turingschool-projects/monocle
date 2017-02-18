class EmployeeRow extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.companyName}</td>
        <td>{this.props.username}</td>
        <td>❌</td>
      </tr>
    )
  }
}
