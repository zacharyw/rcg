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
        channel: "NewMessageCountsChannel",
        id: this.props.conversation_id
      },
      {
        received: function(data) {
          this.updateCount(data.count);
        },
        updateCount: this.updateCount.bind(this)
      }
    );
  }

  updateCount(count) {
    this.setState({count: count});
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
