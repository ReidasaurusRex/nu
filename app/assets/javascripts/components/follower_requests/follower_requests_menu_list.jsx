var FollowerRequestsMenuList = React.createClass({
  render: function() {
    var self = this;
    var requests = this.props.requests.map(function(request) {
      return (<FollowerRequest id={request.id} key={request.id} followerName={request.name} currentProfileID={self.props.currentProfileID} followerID={request.follower_id} followerImage={request.follower_image} />)
    });
    return (
      <div>Hello!</div>
    );
  }  
});