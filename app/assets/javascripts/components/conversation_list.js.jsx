class ConversationList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {conversations: props.conversations}
  }

  componentDidMount() {
    this.setupSubscription();
  }

  updateList(conversation) {
    // Append new conversation to front of list
    this.setState({conversations: [conversation].concat(this.state.conversations)})
  }
  
  render() {
    const conversationList = this.state.conversations.map((conversation) =>
      <Conversation conversation={conversation} key={conversation.id}/>
    );
    return (
      <div>
        {conversationList}
      </div>
    );
  }

  setupSubscription() {
    App.cable.subscriptions.create("ConversationChannel", {
      received: function(conversation) {
        this.updateList(conversation);
      },
      // Assign updateList function from ConversationList class, so it is usable within this subscription
      updateList: this.updateList
    });
  }
}
