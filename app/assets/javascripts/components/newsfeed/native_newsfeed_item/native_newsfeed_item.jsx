var NativeNewsfeedItem = React.createClass({
  getInitialState: function() {
    return {content: this.props.content, displayMenu: false};
  },
  handleMenuClick: function() {
    if (!this.state.displayMenu) {
      this.setState({displayMenu: true});
    } else {
      this.setState({displayMenu: false});
    }
  },
  renderEditForm: function() {

  },
  handleItemUpdate: function() {

  },
  render: function() {
    var menu;
    if (this.state.displayMenu) {
      menu = <NativeNewsfeedMenu newsfeedItemID={this.props.id} currentProfileID={this.props.currentProfileID}  sourceID={this.props.sourceID}/>;
    } else {
      menu = null;
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

          <p className="c-newsfeed-list__item__text">
            {this.state.content}
          </p>

          {menu}

        </div> 

      </div>
    );
  }
});