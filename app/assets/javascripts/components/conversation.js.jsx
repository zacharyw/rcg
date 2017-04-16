class Conversation extends React.Component {
  render() {
    const conversation = this.props.conversation;
    return (
      <div className="col-xs-12 col-sm-6 col-md-4 col-lg-3">
        <div className="panel panel-default conversation" id={"conversation_" + conversation.id}>
          <div className="panel-heading">
            {conversation.author} <span className="text-muted">{conversation.time_ago} ago</span>
          </div>
          <div className="panel-body">
            <div className="conversation-body">
              {conversation.preview}
            </div>
          </div>
        </div>
      </div>
    );
  }
}
