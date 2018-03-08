import React from 'react';
import { Button, FormGroup, Label, Input, Row, Col } from 'reactstrap';

export default class MeetingPost extends React.Component{
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
        <Row>
            <Col>
              <Input
                type="text"
                name="post[body]"
                value={this.state.body}
                onChange={this.handleBodyChange} placeholder="Title!"
              />
            </Col>
            <Col>
              <Input type="textarea" name="text" id="exampleText" placeholder="Description"/>
            </Col>
            <Col>
              <Input type="date" name="date" id="exampleDate" placeholder="date" />
            </Col>
            <Col>
              <Input type="time" name="time" id="exampleTime" placeholder="time placeholder" />
            </Col>
            <Col>
              <Input
                type="text"
                name="post[body]"
                value={this.state.body}
                onChange={this.handleBodyChange} placeholder="Tags!"
              />
            </Col>
            <Col>
              <Button color="danger">Post!</Button>
            </Col>
          </Row>
      </div>
    )
  }
}
