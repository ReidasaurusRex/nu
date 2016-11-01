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
      var profileLike = this.state.likes.find(function(like){return like.profile_id === self.props.currentProfileID;});
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
  handleLikeDestroy: function(e) {
    e.preventDefault();
    console.log("Unlike!");
  },
  handleLikeSubmit: function(e) {
    e.preventDefault();
    console.log("Like!");
  },
  render: function() {
    return (
      <ul className="o-inline-list c-social-overview">
        <li className="o-inlin-list__li c-social-overview__li c-social-overview__likes">
          {this.likeButton()} 
          <span className="u-text--edward">{this.likeNumber()}</span>
        </li>

        <li className="o-inlin-list__li c-social-overview__li c-social-overview__comments">
        
        </li>
      </ul>
    );
  }
});