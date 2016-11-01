var Comments = React.createClass({
  getInitialState: function() {
    return {comments: this.props.comments};
  },
  render: function() {
    var comments = this.state.comments.map(function(comment) {

    });
    return (
      <ul className="c-comments-list">

      </ul>
    );
  }
});