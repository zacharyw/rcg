import React from 'react';
import ConversationOpenLink from "./conversation_open_link";

class Conversation extends React.Component {
  render() {
    const conversation = this.props.conversation;
    return (
      <div className="conversation-col col-xs-12 col-sm-6 col-md-4 col-lg-3">
        <div className="panel panel-default conversation" id={"conversation_" + conversation.id}>
          <div className="panel-heading">
            {conversation.author} <span className="text-muted">{conversation.time_ago} ago</span>
          </div>
          <div className="panel-body">
            <div className="conversation-body">
              {conversation.preview}
            </div>
          </div>
          <div className="panel-footer clearfix">
            <div className="pull-right">
              <ConversationOpenLink
                conversation_id={this.props.conversation.id}
                count={this.props.conversation.new_count}
                url={this.props.conversation.url}
              />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Conversation;
