class NewCommentForm extends React.Component {
  constructor() {
    super();
    this.handleCommentChange = this.handleCommentChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = {
      comment: ''
    }
  }
  handleCommentChange(e) {
    this.setState({comment: e.target.value});
  }
  handleSubmit(e) {
    e.preventDefault();
    var comment = this.state.comment.trim();
    if (!comment) {
      return;
    }
    this.props.onCommentSubmit({comment: {newsfeed_item_id: this.props.newsfeedID, profile_id: this.props.currentProfileID, text: comment}});
    this.setState({comment: ''});
  }
  render() {
    return (
      <li className="o-media c-comments-list__li c-comments-list__new">

        <img className="o-media__img o-img--tiny o-img--round c-comments-list__li__img" src={this.props.currentProfilePhoto} />

        <form onSubmit={this.handleSubmit}>
          <input
            className="c-comments-list__new__text-field"
            type="text"
            placeholder="Post your reply..."
            value={this.state.comment}
            onChange={this.handleCommentChange}
          />
          <input className="u-narrow-button" type="submit" value="Reply" />
        </form>
      </li>
    );
  }
}