class ProfileOverview extends React.Component {
  constructor(props) {
    super(props);
    this.subscriptionLink = this.subscriptionLink.bind(this)
    this.handleFollow = this.handleFollow.bind(this);
    this.handleUnfollow = this.handleUnfollow.bind(this);
    this.state = {
      subscriptionSummary: this.props.subscriptionSummary
    }
  }
  subscriptionLink() {
    switch (this.state.subscriptionSummary) {
      case 'following':
        return <a className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow c-profile-summary__fol-link--pointer" onClick={this.handleUnfollow}>Following</a>
      case 'pending': 
        return <span className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow">Pending</span>
      case 'owned': 
        return <a href={this.props.profilePath} className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow c-profile-summary__fol-link--pointer">View Profile</a>
      case 'notFollowing': 
        return <a className="c-profile-summary__fol-link c-profile-summary__fol-link--follow c-profile-summary__fol-link--pointer" onClick={this.handleFollow}>Follow</a>
    }
  }
  handleFollow(e) {
    e.preventDefault();
    var followUrl = "/profiles/" + this.props.currentProfileID + "/pending_subscriptions"
    $.ajax({
      url: followUrl,
      type: 'POST',
      data: {pending_subscription: {profile_id: this.props.currentProfileID, pending_following_id: this.props.targetProfileID}},
      cache: false,
      dataType: 'json', 
      success: function(data) {
        this.setState({subscriptionSummary: 'pending'})
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr, status, err.toString());
      }.bind(this)
    })
  }
  handleUnfollow(e) {
    e.preventDefault();
    var unfollowUrl = "/profiles/" + this.props.currentProfileID + "/subscriptions/" + this.props.targetProfileID;
    $.ajax({
      url: unfollowUrl,
      type: 'DELETE',
      cache: false,
      dataType: 'json',
      success: function(data){
        this.setState({subscriptionSummary: 'notFollowing'})
      }.bind(this),
      error: function(status, xhr, err) {
        console.log(status, xhr, err);
      }.bind(this)
    })
  }
  render() {
    return (
      <div className="c-profile-summary">
        <a href={this.props.profilePath}>
          <img src={this.props.profileImg} className="o-img--large o-img--round c-profile-summary__el"/>
        </a>
        <h3 className="c-profile-summary__el">{this.props.profileName}</h3>
        <p className="c-profile-summary__el">{this.subscriptionLink()}</p>
      </div>
    );
  }
}