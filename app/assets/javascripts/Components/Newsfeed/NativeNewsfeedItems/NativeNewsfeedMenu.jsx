var NativeNewsfeedMenu = React.createClass({
  editOrUnfollow: function() {
    if (this.props.currentProfileID === this.props.sourceID) {
      return (<a className="u-text--edward" href="#" onClick={this.props.onEditClick}>Edit</a>)
    } else {
      if (this.props.following) {
        return (<a className="u-text--edward" href="#" onClick={this.props.onUnfollow}>Unfollow</a>)  
      } else {
        return (<span className="u-text--apricot">Unfollowed</span>)
      }
      
    }
  },
  deleteOrNot: function() {
    if (this.props.currentProfileID === this.props.sourceID) {
      return (<li className="c-newsfeed-menu__li"><a className="u-text--edward" href="#" onClick={this.props.onDeleteClick}>Delete</a></li>)
    } else {
      return null;
    }
  },
  render: function() {
    var profileUrl = "/profiles/" + this.props.sourceID;
    return (
      <ul className="c-newsfeed-menu">
        <li className="c-newsfeed-menu__li">
          <a className="u-text--edward" href={profileUrl} title="View Profile">View Profile</a>
        </li>
        <li className="c-newsfeed-menu__li">
          {this.editOrUnfollow()}
        </li>
        {this.deleteOrNot()}
      </ul>
    );
  }
});