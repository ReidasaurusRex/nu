var RSSManager = React.createClass({
  getInitialState: function() {
    return {feeds: {current: [], suggested: []}};
  },
  loadFeeds: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data) {
        this.setState({feeds: {current: data.current, suggested: data.suggested}});
        console.log(data);
        console.log("hello");
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.loadFeeds();
  },
  handleFeedSubmit: function(feed) {

  },
  handleFeedDestroy: function(id) {
    
  },
  render: function() {
    var self = this;
    var currentFeeds = this.state.feeds.current.map(function(curFeed) {
      return (<CurrentFeed key={curFeed.id} id={curFeed.id} feedTitle={curFeed.feed_title} profileID={self.props.profileID} onFeedDestroy={self.handleFeedDestroy} />)
    });
    var suggestedFeeds = this.state.feeds.suggested.map(function(sugFeed) {
      return (<SuggestedFeed key={sugFeed.id}  id={sugFeed.id} feedTitle={sugFeed.title} profileID={self.props.profileID} />)
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