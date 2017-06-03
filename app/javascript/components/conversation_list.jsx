import React from 'react';
import Conversation from 'components/conversation';

class ConversationList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {conversations: props.conversations};
  }

  componentDidMount() {
    this.setupSubscription();
  }

  updateList(conversation) {
    conversation = JSON.parse(conversation);
    // Append new conversation to front of list
    this.setState({conversations: [conversation].concat(this.state.conversations)});
  }
  
  render() {
    const conversationList = this.state.conversations.map((conversation) =>
      <Conversation conversation={conversation} key={conversation.id}/>
    );
    return (
      <div id="conversation-list">
        <div className="conversation-col col-xs-12 col-sm-6 col-md-4 col-lg-3" dangerouslySetInnerHTML={{__html: this.props.new_conversation_form}}>
        </div>
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
      updateList: this.updateList.bind(this)
    });
  }
}

export default ConversationList;
