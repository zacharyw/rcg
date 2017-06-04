import React from 'react';

class ConversationOpenLink extends React.Component {
  constructor(props) {
    super(props);
    this.state = {count: props.count};
  }

  componentDidMount() {
    this.setupSubscription();
  }

  setupSubscription() {
    App.cable.subscriptions.create(
      {
        channel: "MessagesChannel",
        id: this.props.conversation_id
      },
      {
        received: function() {
          this.updateCount();
        },
        // Assign updateList function from ConversationList class, so it is usable within this subscription
        updateCount: this.updateCount.bind(this)
      }
    );
  }

  updateCount() {
    // Append new conversation to front of list
    this.setState({count: this.state.count + 1});
  }

  render() {
    const url = this.props.url;
    const count = this.state.count;
    const conversation_id = this.props.conversation_id;

    return (
      <a href={url} id={"conversation-" + conversation_id + "-link"} className="btn btn-primary btn-xs">
        Open <span className="badge">{count}</span>
      </a>
    );
  }
}

export default ConversationOpenLink;
