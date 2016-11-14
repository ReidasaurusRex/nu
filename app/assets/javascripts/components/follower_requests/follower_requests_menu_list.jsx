var FollowerRequestsMenuList = React.createClass({
  getInitialState: function() {
    return {pendingFollows: [], loaded: false};
  },
  loadPendingFollows: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data) {
        console.log(data);
        this.setState({pendingFollows: data.pending_follows});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr, this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function() {
    console.log(this.props);
    this.loadPendingFollows();
  },
  pendingFollowsOrLoading: function() {
    var self = this;
    if (this.state.loaded) {
      return (<li className="o-dropdown__li c-noti-dropdown__li">Loading</li>)
    } else {
      var pendingFollows = this.state.pendingFollows.map(function(pF) {
        return (<FollowerRequest id={pF.id} key={pF.id} followerName={pF.follower_name} currentProfileID={self.props.currentProfileID} followerID={pF.follower_id} followerPic={pF.follower_pic} />)
      });
      return pendingFollows;
    }
  },
  render: function() {
    var self = this;   
    return (
      <div className="c-noti-dropdown__pf-list">
        {this.pendingFollowsOrLoading()}
      </div>
    );
  }  
});