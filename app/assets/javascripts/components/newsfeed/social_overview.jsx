var SocialOverview = React.createClass({
  getInitialState: function() {
    return {likes: this.props.likes, comments: this.props.comments};
  },
  likeButton: function() {
    var self = this;
    var likeProfileIds = this.state.likes.map(function(like) {
      return like.profile_id;
    });
    if (likeProfileIds.includes(this.props.currentProfileID)) {
      return (
        <a href="#" title="Unappreciate" onClick={this.handleLikeDestroy}><i className="fa fa-heart c-social-overview__li__icon u-text--apricot"></i></a>
      )
    } else {
      return (
        <a href="#" title="Appreciate" onClick={this.handleLikeSubmit}><i className="fa fa-heart c-social-overview__li__icon u-text--edward"></i></a>
      )
    }
  },
  likeNumber: function() {
    if (this.state.likes.length > 0) {
      return this.state.likes.length;
    } else {
      return "";
    }
  },
  commentButton: function() {
    var self = this;
    var commentProfileIds = this.state.comments.map(function(comment) {
      return comment.profile_id;
    });
    if (commentProfileIds.includes(this.props.currentProfileID)) {
      var profileComment = this.state.comments.find(function(comment){return comment.profile_id === self.props.currentProfileID;});
      return (
        <i className="fa fa-reply c-social-overview__li__icon u-text--monte-carlo"></i>
      )
    } else {
      return (
        <i className="fa fa-reply c-social-overview__li__icon u-text--edward"></i>
      )
    }
  },
  commentNumber: function() {
    if (this.state.comments.length > 0) {
      return this.state.comments.length;
    } else {
      return "";
    }
  },
  handleLikeDestroy: function(e) {
    var self = this;
    e.preventDefault();
    var profileLikeID = this.state.likes.find(function(like){return like.profile_id === self.props.currentProfileID;}).id;
    var destroyUrl = "/newsfeed_items/" + this.props.newsfeedID + "/likes/" + profileLikeID;
    $.ajax({
      url: destroyUrl,
      dataType: 'json',
      type: 'DELETE', 
      cache: false,
      success: function(likes) {
        this.setState({likes: likes});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(destroyUrl, status, err.toString());
      }.bind(this)
    });
  },
  handleLikeSubmit: function(e) {
    var self = this;
    e.preventDefault();
    var createUrl = "/newsfeed_items/" + this.props.newsfeedID + "/likes"
    $.ajax({
      url: createUrl,
      dataType: 'json',
      type: 'POST',
      cache: false,
      success: function(likes) {
        this.setState({likes: likes});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(createUrl, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <ul className="o-inline-list c-social-overview">
        
        <li className="o-inline-list__li c-social-overview__li c-social-overview__comments">
          {this.commentButton()}
          <span className="u-text--edward">{this.commentNumber()}</span>
        </li>

        <li className="o-inline-list__li c-social-overview__li c-social-overview__likes">
          {this.likeButton()} 
          <span className="u-text--edward">{this.likeNumber()}</span>
        </li>

      </ul>
    );
  }
});