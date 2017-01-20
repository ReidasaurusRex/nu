class NotificationsMenu extends React.Component {
  constructor() {
    super();
    this.state = {
      empty: true
    }
  }
  render() {
    var pendingFollowsUrl = "/profiles/" + this.props.profileID + "/pending_follows"
    return(
      <ul className="o-dropdown c-noti-dropdown">
        <li>Notifications</li>
        <FollowerRequestsMenuList currentProfileID={this.props.currentProfileID} url={pendingFollowsUrl} />
      </ul>
    )
  }
}