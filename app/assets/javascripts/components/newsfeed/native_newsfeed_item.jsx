var NativeNewsfeedItem = React.createClass({
  getInitialState: function() {
    return {content: this.props.content};
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
            <NativeNewsfeedMenu />
          </p>

          <p className="c-newsfeed-list__item__text">
            {this.state.content}
          </p>

        </div> 

      </div>
    );
  }
});