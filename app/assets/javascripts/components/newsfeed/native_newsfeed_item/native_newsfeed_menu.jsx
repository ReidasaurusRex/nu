var NativeNewsfeedMenu = React.createClass({
  render: function() {
    var profileUrl = "/profiles/" + this.props.sourceID;
    return (
      <ul className="c-newsfeed-menu">
        <li className="c-newsfeed-menu__li">
          <a href={profileUrl} title="View Profile">View Profile</a>
        </li>
        <li className="c-newsfeed-menu__li">
          Unfollow
        </li>
      </ul>
    );
  }
});