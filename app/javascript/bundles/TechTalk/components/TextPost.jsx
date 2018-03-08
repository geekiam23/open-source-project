import React from 'react';
import { Button } from 'reactstrap';

export default class TextPost extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      body: this.props.body
    }
    this.handleBodyChange = this.handleBodyChange.bind(this);
  }

  handleBodyChange(e) {
    this.setState({ body: e.target.value });
  }
  render (){
    return (
      <div>
        <input
          type="text"
          name="post[body]"
          value={this.state.body}
          onChange={this.handleBodyChange} placeholder="Post Here!"/>
          <Button color="danger">Post!</Button>
      </div>
    )
  }
}
