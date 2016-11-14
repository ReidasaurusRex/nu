var FollowerRequest = React.createClass({
  getInitialState: function() {
    return {status: "pending"};
  },
  handleAccept: function(e) {
    e.preventDefault();
    console.log("Accepted");
  },
  handleReject: function(e) {
    e.preventDefault();
    console.log("Rejected");
  },
  properPrompt: function() {
    switch (this.state.status) {
      case "pending":
        return "wants to follow you";
      case "accepted":
        return "is following you";
      case "rejected":
        return "follow request deleted";
    }
  },
  linksOrNot: function() {
    if (this.state.status === "pending") {
      return (
        <div className="o-media__ext">
          <a className="c-noti-dropdown__li__pf-resp u-text--apricot" href="#" onClick={this.handleReject}>
            <i className="fa fa-times"></i>
          </a>
          <a className="c-noti-dropdown__li__pf-resp u-text--wild-willow" href="#" onClick={this.handleAccept}>
            <i className="fa fa-check"></i>
          </a>
        </div>
      );
    } else {
      return null;
    }
  },
  render: function() {
    return(
      <li className="o-dropdown__li c-noti-dropdown__li">
        
        <div className="o-media__img c-noti-dropdown__li__img">
          <img className="o-img--round o-img--tiny" src={this.props.followerPic} />
        </div>

        <div className="o-media__bd c-noti-dropdown__li__bd">
          {this.props.followerName} {this.properPrompt()}
        </div>

        {this.linksOrNot()}        

      </li>
    );
  }
});