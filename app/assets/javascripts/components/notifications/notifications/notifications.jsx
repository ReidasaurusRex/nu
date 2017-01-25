class Notifications extends React.Component {
  constructor() {
    super();
    this.loadNotifications = this.loadNotifications.bind(this);
    this.state = {
      notifications: [],
      loaded: false
    }
  }
  componentDidMount() {
    this.loadNotifications(3);
  }
  loadNotifications(num) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      data: {num: num}, 
      type: 'GET',
      cache: false,
      success: function(data) {
        console.log(data);
        this.setState({loaded: true, notifications: data.notifications})
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr, this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  notificationsOrLoading() {
    var self = this;
    if (!this.state.loaded) {
      return (<li className="o-dropdown__li c-noti-dropdown__li">Loading notifications...</li>)
    } else if (this.state.notifications.length !== 0) {
      var notifications = this.state.notifications.map(function(noti) {
        return (
          <Notification id={noti.id} key={noti.id} image={noti.image} text={noti.text} link={noti.link} profileID={self.props.currentProfileID} unseen={noti.unseen}/>
        );
      });
      return notifications;
    } else {
      return (<li classNmae="o-dropdown__li c-noti-dropwdown__li">No notifications</li>);
    }
  }
  render() {
    return (
      <ul className="c-noti-dropdown__noti-list">
          {this.notificationsOrLoading()}
      </ul>
    );
  }
}