var FollowerRequest = React.createClass({
  getInitialState: function() {
    return {status: "pending"};
  },
  handleAccept: function(e) {
    e.preventDefault();
  },
  handleDestroy: function(e) {
    e.preventDefault();
  },
  render: function() {
    return(
      <li className="o-dropdown__li c-noti-dropdown__li">
        
        <div className="o-media__img c-noti-dropdown__li__img">
          <img className="o-img--round o-img--tiny" src={this.props.followerImage} />
        </div>

        <div className="o-media__bd c-noti-dropdown__li__bd">
          {this.props.followerName} {this.properPrompt}
        </div>

        <div className="o-media__ext">
          <a className="c-noti-dropdown__li__pf-resp u-text--apricot" href="#" onClick={this.handleDestroy}>
            <i className="fa fa-times"></i>
          </a>
          <a className="c-noti-dropdown__li__pf-resp u-text--wild-willow" href="#" onClick={this.handleAccept}>
            <i className="fa fa-check"></i>
          </a>
        </div>

      </li>
    );
  }
});