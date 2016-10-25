var FeedNewsfeedItem = React.createClass({
  render: function() {
    return (
      <h3 className="c-newsfeed-list__item__title c-newsfeed-list__item__text">
        {this.props.feed} 
        <span className="c-newsfeed-list__item__pd">RSS • {this.props.tsc}</span>
      </h3>

      <div className="o-media c-rss-newsfeed-item__media">


        this.imageOrNot();

        <div class="o-media__bd c-rss-newsfeed-item__media__bd">

          <p class="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text">{this.props.sourceName}</p>
          <p class="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text"><a href={this.props.url} className="u-text--apricot" target="_blank">View Article</a></p>

        </div>

      </div>
    );
  },

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
  }
});