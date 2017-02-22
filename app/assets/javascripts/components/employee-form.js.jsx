class EmployeeForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = { firstName: '', lastName: '' }

    this.handleFirstNameChange = this.handleFirstNameChange.bind(this)
    this.handleLastNameChange = this.handleLastNameChange.bind(this)
  }

  handleFirstNameChange(event) {
    this.setState( { firstName: event.target.value })
  }

  handleLastNameChange(event) {
    this.setState( { lastName: event.target.value })
  }

  userMatches(userInput) {
    let matchedUsers = this.props.censusUsers.filter((user) => {
      lowerName = user.name.toLowerCase()
      return lowerName.includes(userInput.toLowerCase())
    })
    this.setState({ matches: matchedUsers })
  }

  render () {
    if (this.props.showComponent) {
      return (
        <form onSubmit={this.props.createEmployee.bind(this, event)}>
          <label>First Name:
            <input type='text' name='first-name' id='first-name' onChange={this.handleFirstNameChange}
              onKeyUp={this.userMatches.bind(this, event.target.value)} />
          </label>
          <label>Last Name:
            <input type='text' name='last-name' id='last-name' onChange={this.handleLastNameChange} />
          </label>
          <input type='submit' value='Create Employee' />
          <a value='test butt' onClick={this.getAllCensusUsers}>Testy</a>
        </form>
      )
    } else {
      return (
        <form></form>
      )
    }
  }

}
