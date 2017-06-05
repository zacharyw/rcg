import React from 'react';

class Message extends React.Component {
  render() {
    const message = this.props.message;
    return (
      <p id={message.id} className="message">
        <strong>{message.author}:</strong>&nbsp;<span className="message-body">{message.body}</span>
      </p>
    );
  }
}

export default Message;
