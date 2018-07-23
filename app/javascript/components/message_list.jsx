import React from 'react';
import Rails from 'rails-ujs';
import Message from './message';
import {resizeMessages} from '../conversations';

class MessageList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {messages: props.messages};
  }

  componentDidMount() {
    resizeMessages();
    this.setupSubscription();
  }

  updateList(message) {
    message = JSON.parse(message);
    // Append new message to end of list
    this.setState({
      messages: this.state.messages.concat([message])
    });
    MessageList.markRead();
  }

  static markRead() {
    if(!document.hidden) {
      Rails.fire($.one('#mark-read-form'), 'submit');
    }
  }

  render() {
    const messageList = this.state.messages.map((message) =>
      <Message message={message} key={message.id}/>
    );
    return (
      <div className="messages">
        {messageList}
      </div>
    );
  }

  setupSubscription() {
    App.cable.subscriptions.create(
      {
        channel: "MessagesChannel",
        id: this.props.conversation_id
      },
      {
        received: function (message) {
          this.updateList(message);
        },
        // Assign updateList function from MessageList class, so it is usable within this subscription
        updateList: this.updateList.bind(this)
      }
    );
  }
}

export default MessageList;
