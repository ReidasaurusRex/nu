class NotificationsMenu extends React.Component {
  constructor() {
    super();
    this.state = {
      empty: true
    }
  }
  render() {
    var pendingFollowsUrl = "/profiles/" + this.props.profileID + "/pending_follows";
    var notificationsUrl = "/profiles/" + this.props.profileID + "/notifications";
    return (
      <ul className="o-dropdown c-noti-dropdown">
        <Notifications currentProfileID={this.props.currentProfileID} url={notificationsUrl} />
        <FollowerRequestsMenuList currentProfileID={this.props.currentProfileID} url={pendingFollowsUrl} />
      </ul>
    )
  }
}