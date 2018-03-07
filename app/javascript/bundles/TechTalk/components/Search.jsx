import PropTypes from 'prop-types';
import React from 'react';

export default class Search extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      qqq: ''
    }
  }

  handleSearch (e) {
    this.setState({ qqq: e.target.value })
  }

  handleGoClick () {

  }

  render () {
    return (
      <div className='searchbar-container'>
        <form onSubmit={e => e.preventDefault()}>
          <div className="buttonInside">
            <input
              type='text'
              size='25'
              placeholder='Search here...'
              onChange={this.handleSearch.bind(this)}
              value={this.state.qqq} className="searchInput" />
            <button
              type='submit' className="searchButton"
              onClick={this.handleGoClick.bind(this)}>
              Go!
            </button>
          </div>
        </form>
      </div>
    )
  }
}
