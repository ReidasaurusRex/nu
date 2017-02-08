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
        return <a className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow" onClick={this.handleUnfollow}>Following</a>
      case 'pending': 
        return <span className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow">Pending</span>
      case 'owned': 
        return <a href={this.props.profilePath} className="c-profile-summary__fol-link c-profile-summary__fol-link--unfollow">View Profile</a>
      case 'notFollowing': 
        return <a className="c-profile-summary__fol-link c-profile-summary__fol-link--follow" onClick={this.handleFollow}>Follow</a>
    }
  }
  handleFollow(e) {
    e.preventDefault();
    console.log(e.target)
  }
  handleUnfollow(e) {
    e.preventDefault();
    console.log(e.target)
  }
  render() {
    return (
      <div className="c-profile-summary">
        <a href={this.props.profilePath}>
          <img src={this.props.profileImg} className="o-img--large o-img--round c-profile-summary__el"/>
        </a>
        <h3 className="c-profile-summary__el">{this.props.profileName}</h3>
        <p className="c-profile-summary__el"></p>
      </div>
    );
  }
}