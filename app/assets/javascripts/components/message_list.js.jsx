class MessageList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {messages: props.messages, conversation_id: props.conversation_id};
  }

  componentDidMount() {
    this.setupSubscription();
  }

  updateList(message) {
    message = JSON.parse(message);
    // Append new message to end of list
    this.setState({
      messages: this.state.messages.concat([message]),
      conversation_id: this.state.conversation_id
    });
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
        id: this.state.conversation_id
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
