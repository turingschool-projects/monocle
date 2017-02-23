class WorkHereButton extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <button id='work-here-button' className='btn btn-default' onClick={this.props.createEmployee} disabled={this.props.buttonDisabled}>
        <i className='glyphicon glyphicon-briefcase'></i> I work here
      </button>
    )
  }
}
