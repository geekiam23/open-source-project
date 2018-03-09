import React from 'react';
import { Card, CardBody, Button, CardTitle, CardText, CardImg, Container, Row, Col } from 'reactstrap';

export default class PostCard extends React.Component{
  constructor(props){
    super(props);

    this.state = {
      body: this.props.content
    }
  }
  render (){
    return (
      <div>
        <Card>
          <CardBody>
            <CardTitle>Card Title</CardTitle>

            <CardText>{ console.log(this.state.body) }
           </CardText>
            <CardText>
              <small className="text-muted">Last updated 3 mins ago</small>
            </CardText>
          </CardBody>
          <CardImg top width="100%" src="https://placeholdit.imgix.net/~text?txtsize=33&txt=318%C3%97180&w=318&h=180" alt="Card image cap" />
        </Card>
      </div>
    );
  };
}
