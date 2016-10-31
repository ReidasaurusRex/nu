var NativeNewsfeedItem = React.createClass({
  render: function() {
    return (
      <div className="o-bubble o-bubble--no-pad c-newsfeed-list__item">
        <div className="c-newsfeed-list__item--padding">
          <div className="o-media">

            <img src={this.props.image} alt="" className="o-media__img o-img--small o-img--round"/>

            <div className="o-media__bd c-newsfeed-list__item__bd">
              
              <p className="c-newsfeed-list__item__text">
                {this.props.sourceName}
                <span className="c-newsfeed-list__item__pd">{this.props.tsc}</span>
              </p>

              <p className="c-newsfeed-list__item__text">
                {this.props.content}  
              </p>

              <SocialOverview likes={this.props.likes} comments={this.props.comments} currentProfileID={this.props.currentProifleID} />
              
            </div> 
          </div>
        </div>
      </div>
    );
  }
});