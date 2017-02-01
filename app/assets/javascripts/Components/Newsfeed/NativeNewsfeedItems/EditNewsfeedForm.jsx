class EditNewsfeedForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleContentChange = this.handleContentChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = {
      content: this.props.content
    }
  }
  handleContentChange(e) {
    this.setState({content: e.target.value});
  }
  handleSubmit(e) {
    e.preventDefault();
    var content = this.state.content.trim();
    if (!content) {
      return;
    }
    this.props.onNewsfeedItemUpdate({newsfeed_item: {content: content}});
  }
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <textarea 
          rows="2" 
          value={this.state.content}
          onChange={this.handleContentChange}
          />
        <input type="submit" value="Edit" />
      </form>
    );
  }
}