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
    this.loadNotifications();
  }
  loadNotifications() {
    $.ajax({
      url: this.props.url,
      dataType: 'json', 
      type: 'GET',
      cache: false,
      success: function(data) {

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
    } else {
      var notifications = this.state.notifications.map(function(noti) {
        return (
          <Notification id={noti.id} key={noti.id} image={noti.image} text={noti.text} link={noti.link} profileID={self.props.currentProfileID} />
        );
      });
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