var Comments = React.createClass({
  getInitialState: function() {
    return {comments: this.props.comments};
  },
  render: function() {
    var comments = this.state.comments.map(function(comment) {
      return (<Comment id={comment.id} key={comment.id} profileID={comment.profile_id} newsfeedID={comment.newsfeed_item_id} text={comment.text} profilePhoto={comment.profile_photo} />)
     });
    return (
      <ul className="c-comments-list">
        
      </ul>
    );
  }
});