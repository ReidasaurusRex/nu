var RSSManager = React.createClass({
  getInitialState: function() {
    return {feeds: []};
  },
  loadFeeds: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data) {
        this.setState({feeds: {current: data.current, suggested: data.suggested}});
        console.log(data.current);
        console.log("hello");
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.loadFeeds();
  },
  handleFeedSubmit: function() {

  },
  handleFeedDestroy: function() {
    
  },
  render: function() {
    var currentFeeds = this.state.feeds.current.map(function(curFeed) {
      return (<CurrentFeed key={curFeed.id} feedTitle={curFeed.feed_title} profileID={this.props.profileID} />)
    });
    var suggestedFeeds = this.state.feeds.suggested.map(function(sugFeed) {
      return (<SuggestedFeed key={sugFeed.id}  feedTitle={sugFeed.feed_title} profileID={this.props.profileID} />)
    });
    return (
      <div className="c-rss-manage__lists">

        <div className="c-rss-manage__section">
          <h2>Your Feeds</h2>
          <ul>
            {currentFeeds}
          </ul>
        </div>

        <div className="c-rss-manage__section">
          <h2>Suggested Feeds</h2>
          <ul>
            {suggestedFeeds}
          </ul>
        </div>

      </div>
    )
  }
});