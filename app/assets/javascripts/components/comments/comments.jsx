class Comments extends React.Component {
  constructor(props) {
    super(props);
    this.handleCommentSubmit = this.handleCommentSubmit.bind(this);
    this.state = {
      comments: this.props.comments
    }
  }
  handleCommentSubmit(comment) {
    var postUrl = "/newsfeed_items/" + this.props.newsfeedID + "/comments";
    $.ajax({
      url: postUrl,
      dataType: 'json',
      type: 'POST',
      data: comment,
      cache: false,
      success: function(data) {
        this.setState({comments: data.comments});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  render() {
    var comments = this.state.comments.map(function(comment) {
      return (<Comment id={comment.id} key={comment.id} profileID={comment.profile_id} newsfeedID={comment.newsfeed_item_id} text={comment.text} profilePhoto={comment.profile_photo} profileName={comment.profile_name} tsc={comment.tsc} />)
     });
    return (
      <ul className="c-comments-list">
        <NewCommentForm newsfeedID={this.props.newsfeedID} currentProfilePhoto={this.props.currentProfilePhoto} currentProfileID={this.props.currentProfileID} onCommentSubmit={this.handleCommentSubmit}/>
        {comments}
      </ul>
    );
  }
}