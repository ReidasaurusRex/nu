var FeedNewsfeedItem = React.createClass({
  imageOrNot: function() {
    if (this.props.image) {
      return (
        <div className="o-media__img">
          <img src={this.props.image} alt="" className="c-rss-newsfeed_item__media__img"/>
        </div>
      )
    } else {
      return false
    }
  },
  render: function() {
    return (
      <div className="o-bubble o-bubble--no-pad c-newsfeed-list__item">
        <div className="c-newsfeed-list__item--padding">
          <h3 className="c-newsfeed-list__item__title c-newsfeed-list__item__text">
            {this.props.feed}
            <span className="c-newsfeed-list__item__pd">RSS • {this.props.tsc}</span>
          </h3>

          <div className="o-media c-rss-newsfeed-item__media">

            {this.imageOrNot()}

            <div className="o-media__bd c-rss-newsfeed-item__media__bd">

              <p className="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text">{this.props.sourceName}</p>
              <p className="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text"><a href={this.props.url} className="u-text--apricot" target="_blank">View Article</a></p>

              <SocialOverview likes={this.props.likes} comments={this.props.comments} currentProfileID={this.props.currentProfileID} />

            </div>

          </div>
        </div>
      </div>
    );
  }
});