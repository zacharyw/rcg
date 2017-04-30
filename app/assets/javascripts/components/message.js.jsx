class Message extends React.Component {
  render() {
    const message = this.props.message;
    return (
      <p id={message.id}>
        <strong>{message.author}:</strong> {message.body}
      </p>
    );
  }
}
