import PropTypes from 'prop-types';
import React from 'react';
import Header from './Header'
import { Button } from 'reactstrap';

export default class App extends React.Component {

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://reactjs.org/docs/state-and-lifecycle.html#adding-local-state-to-a-class
    this.state = {

    };
  }

  render() {
    return (
      <div>
        <Header>
        </Header>
      </div>
    );
  }
}
