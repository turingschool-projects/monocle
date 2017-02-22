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

  createDataList() {
    let dataList = document.getElementById('matches-datalist')
    this.props.censusUsers.forEach((match) => {
      let option = document.createElement('option')
      option.value = match.name
      dataList.appendChild(option)
    })
  }

  clearDataList() {
    let dataList = document.getElementById('matches-datalist')
    while (dataList.children.length >= 1) {
      dataList.removeChild(dataList.childNodes[0])
    }
  }

  handleEnter(event) {
    if (event.key == 'Enter') {
      event.preventDefault()
      this.moveSelectedValue(event.target.value)
    }
  }

  clearSelector() {
    document.getElementById('first-name').reset()
  }

  render () {
    if (this.props.showComponent) {
      return (
        <form onSubmit={this.props.createEmployee.bind(this, event)} >
          <label>Name:
            <input type='text' name='first-name' id='first-name' list="matches-datalist"
              onChange={this.handleFirstNameChange}
              onKeyUp={this.userMatches.bind(this, event.target.value)}
              onFocus={this.createDataList.bind(this)}
              onBlur={this.clearDataList.bind(this)} />
          </label>
          <datalist id='matches-datalist'></datalist>
          <label>Last Name:
            <input type='text' name='last-name' id='last-name' onChange={this.handleLastNameChange} />
          </label>
          <input type='submit' value='Create Employee' />
        </form>
      )
    } else {
      return (
        <form></form>
      )
    }
  }

}
