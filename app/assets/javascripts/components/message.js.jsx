class Message extends React.Component {
  render() {
    const message = this.props.message;
    return (
      <p id={message.id} className="message">
        <strong>{message.author}:</strong> {message.body}
      </p>
    );
  }
}
