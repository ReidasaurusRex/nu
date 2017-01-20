var NativeNewsfeedItem = React.createClass({
  getInitialState: function() {
    return {content: this.props.content, displayMenu: false, editContent: false, following: true};
  },
  handleMenuClick: function() {
    if (!this.state.displayMenu) {
      this.setState({displayMenu: true});
    } else {
      this.setState({displayMenu: false});
    }
  },
  handleEditClick: function(e) {
    e.preventDefault();
    this.setState({editContent: true, displayMenu: false});
    console.log("Clicked edit and shit!");
    console.log(e.target);
  },
  handleNewsfeedItemUpdate: function(content) {
    var updateUrl = "/profiles/" + this.props.currentProfileID + "/newsfeed_items/" + this.props.id;
    $.ajax({
      url: updateUrl,
      dataType: 'json',
      type: 'PUT',
      data: content, 
      cache: false,
      success: function(data) {
        this.setState({content: data.content, editContent: false});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  sendDelete: function(e) {
    e.preventDefault();
    this.setState({displayMenu: false});
    if (confirm("Delete this post?")) {
      this.props.onDelete(this.props.id);
    }
  },
  handleUnfollow: function(e) {
    e.preventDefault();
    this.setState({displayMenu: false});
    var destroyUrl = "/profiles/" + this.currentProfileID + "/subscriptions/" + this.props.sourceID;
    $.ajax({
      url: destroyUrl,
      dataType: 'json',
      type: 'DELETE',
      cache: false,
      success: function() {
        this.setState({following: false});
        alert("Unfollowed " + this.props.sourceName);
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    var menu, contentOrForm;
    if (this.state.displayMenu) {
      menu = <NativeNewsfeedMenu newsfeedItemID={this.props.id} currentProfileID={this.props.currentProfileID}  sourceID={this.props.sourceID} following={this.state.following}  
              onEditClick={this.handleEditClick} onUnfollow={this.handleUnfollow} onDeleteClick={this.sendDelete} />;
    } else {
      menu = null;
    }
    if (this.state.editContent) {
      contentOrForm = <EditNewsfeedForm content={this.state.content} newsfeedItemID={this.props.id} currentProfileID={this.props.currentProfileID} onNewsfeedItemUpdate={this.handleNewsfeedItemUpdate}/>
    } else {
      contentOrForm = <p className="c-newsfeed-list__item__text">{this.state.content}</p>
    }
    return (
      <div className="o-media c-newsfeed-list__item__media">

        <img src={this.props.image} alt="" className="o-media__img o-img--small o-img--round"/>

        <div className="o-media__bd c-newsfeed-list__item__bd">
          
          <p className="c-newsfeed-list__item__text">
            {this.props.sourceName}
            <span className="c-newsfeed-list__item__pd">{this.props.tsc}</span>
            <span onClick={this.handleMenuClick}><i className="fa fa-angle-down c-newsfeed-list__item__menu-prompt"></i></span>
          </p>

          {contentOrForm}

          {menu}

        </div> 

      </div>
    );
  }
});