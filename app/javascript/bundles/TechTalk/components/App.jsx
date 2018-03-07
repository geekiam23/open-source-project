import PropTypes from 'prop-types';
import React from 'react';
import Sample from './Sample'

export default class App extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = {
      name: this.props.name,
      number: this.props.number
    };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  render() {
    return (
      <div>
        <h3 className='btn btn-primary btn-lg'>
          Hello, {this.state.name}!
        </h3>
        <Sample />
      </div>
    );
  }
}
