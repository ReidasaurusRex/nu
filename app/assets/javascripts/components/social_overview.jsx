var SocialOverview = React.createClass({
  likeButton: function() {
    var likeProfileIds = this.props.likes.map(function(like) {
      return like.profile_id;
    });
    if (likeProfileIds.includes(this.props.currentProfile)) {
      var profileLike = this.props.likes.find(function(like){return like.profile_id === this.props.currentProfile;});
      return (
        <a href="#" title="Unappreciate" onClick={this.destroyLike(profileLike)}><i className="fa fa-heart u-text--apricot"></i></a>
      )
    } else {

    }
  },
  destroyLike: function(profileLike) {
    $.ajax(profileLike) {
      
    }
  }
  render: function() {
    return (
      <ul className="o-inline-list c-social-overview">
        <li className="o-inlin-list__li c-social-overview__li c-social-overview__likes">
          
        </li>

        <li className="o-inlin-list__li c-social-overview__li c-social-overview__comments">
        
        </li>
      </ul>
    );
  }
});