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
    console.log(this.state.displayMenu);
  },
  renderEditForm: function() {

  },
  handleItemUpdate: function() {

  },
  render: function() {
    return (
      <div className="o-media">

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

        </div> 

      </div>
    );
  }
});