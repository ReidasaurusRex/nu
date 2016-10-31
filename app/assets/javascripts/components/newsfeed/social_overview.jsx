var SocialOverview = React.createClass({
  likeButton: function() {
    console.log(this.props.likes);
    // var likeProfileIds = this.props.likes.map(function(like) {
    //   return like.profile_id;
    // });
    // if (likeProfileIds.includes(this.props.currentProfile)) {
    //   var profileLike = this.props.likes.find(function(like){return like.profile_id === this.props.currentProfile;});
    //   return (
    //     <a href="#" title="Unappreciate" onClick={this.handleLikeDestroy(profileLike)}>heart</a>
    //   )
    // } else {
    //   return (
    //     <a href="#" title="Appreciate" onClick={this.handleLikeSubmit()}>heart</a>
    //   )
    // }
  },
  handleLikeDestroy: function(profileLike) {
    console.log("Unlike!");
  },
  handleLikeSubmit: function() {
    console.log("Like!");
  },
  render: function() {
    return (
      <ul className="o-inline-list c-social-overview">
        <li className="o-inlin-list__li c-social-overview__li c-social-overview__likes">
          {this.likeButton()}
        </li>

        <li className="o-inlin-list__li c-social-overview__li c-social-overview__comments">
        
        </li>
      </ul>
    );
  }
});