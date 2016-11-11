var FollowerRequestsMenuList = React.createClass({
  render: function() {
    var self = this;
    var requests = this.props.requests.map(function(request) {
      return (<FollowerRequest id={request.id} key={request.id} name={request.name} currentProfileID={self.props.currentProfileID} followerID={request.follower_id})
    });
    return (
      <div>Hello!</div>
    );
  }  
});