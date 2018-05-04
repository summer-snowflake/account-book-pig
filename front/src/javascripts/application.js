import React from 'react'
import { render } from 'react-dom'

class AccountBook extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className="AccountBookComponent">
        {'hello world!!'}
      </div>
    )
  }
}

render(
  <AccountBook url='/' />,
  document.getElementById('content')
)
