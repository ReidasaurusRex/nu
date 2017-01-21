class FollowerRequestsMenuList extends React.Component {
  constructor() {
    super();
    this.loadPendingFollows = this.loadPendingFollows.bind(this);
    this.handleResolve = this.handleResolve.bind(this);
    this.state = {
      pendingFollows: [],
      loaded: false,
      length: null
    }
  }
  componentDidMount() {
    this.loadPendingFollows();
  }
  loadPendingFollows() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data) {
        this.setState({pendingFollows: data.pending_follows, loaded: true, length: data.pending_follows.length});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr, this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  handleResolve() {
    var newLength = this.state.length - 1;
    this.setState({length: newLength});
  }
  followerRequestsHeader() {
    return (
      <li className="o-dropdown__li c-noti-dropdown__li c-noti-dropdown__li--header">
        Follower Requests <span className="c-noti-dropdown__li--header__right c-noti-dropdown__li--header__right--req-num">{this.state.length}</span>
      </li>
    );
  }
  pendingFollowsOrLoading() {
    var self = this;
    if (!this.state.loaded) {
      return (<li className="o-dropdown__li c-noti-dropdown__li">Loading</li>)
    } else {
      var pendingFollows = this.state.pendingFollows.map(function(pF) {
        return (
          <FollowerRequest id={pF.id} key={pF.id} followerName={pF.follower_name} currentProfileID={self.props.currentProfileID} followerID={pF.follower_id} followerPic={pF.follower_pic} onResolve={self.handleResolve}/>
        )
      });
      return pendingFollows;
    }
  }
  render() {
    var self = this;   
    return (
      <ul className="c-noti-dropdown__pf-list">
        {this.followerRequestsHeader()}
        {this.pendingFollowsOrLoading()}
      </ul>
    );
  }  
}