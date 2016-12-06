var NotificationsMenu = React.createClass({
  getInitialState: function() {
    return {empty: true}
  }, 
  render: function() {
    var pendingFollowsUrl = "/profiles/" + this.props.profileID + "/pending_follows"
    return(
      <ul className="o-dropdown c-noti-dropdown">
        <li>Notifications</li>
        <FollowerRequestsMenuList currentProfileID={this.props.currentProfileID} url={pendingFollowsUrl} />
      </ul>
    )
  }
})