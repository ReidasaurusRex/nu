var NativeNewsfeedMenu = React.createClass({
  editOrUnfollow: function() {
    if (this.props.currentProfileID === this.props.sourceID) {
      return (<a href="#" onClick={this.props.handleEditClick}>Edit</a>)
    } else {
      return (<a href="#" onClick={this.props.handleUnfollow}>Unfollow</a>)
    }
  },
  render: function() {
    var profileUrl = "/profiles/" + this.props.sourceID;
    return (
      <ul className="c-newsfeed-menu">
        <li className="c-newsfeed-menu__li">
          <a href={profileUrl} title="View Profile">View Profile</a>
        </li>
        <li className="c-newsfeed-menu__li">
          {this.editOrUnfollow()}
        </li>
      </ul>
    );
  }
});