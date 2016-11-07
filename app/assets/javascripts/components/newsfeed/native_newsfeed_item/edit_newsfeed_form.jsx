var EditNewsfeedForm = React.createClass({
  getInitialState: function() {
    return {content: this.props.content};
  },
  handleContentChange: function(e) {
    this.setState({content: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var content = this.state.content.trim();
    if (!content) {
      return;
    }
    this.props.onNewsfeedItemUpdate(content);
  },
  render: function() {
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
});