class RSSManager extends React.Component {
  constructor() {
    super();
    this.loadFeeds = this.loadFeeds.bind(this);
    this.handleFeedSubmit = this.handleFeedSubmit.bind(this);
    this.handleFeedDestroy = this.handleFeedDestroy.bind(this);
    this.state = {
      feeds: {
        current: [],
        suggested: []
      }
    }
  }
  loadFeeds() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data) {
        this.setState({feeds: {current: data.current, suggested: data.suggested}});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  componentDidMount() {
    this.loadFeeds();
  }
  handleFeedSubmit(feed) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST', 
      data: feed,
      success: function(data) {
        this.setState({feeds: {current: data.current, suggested: data.suggested}});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  handleFeedDestroy(feedId) {
    var destroyUrl = this.props.url + "/" + feedId.id;
    $.ajax({
      url: destroyUrl,
      dataType: 'json',
      type: 'DELETE', 
      data: feedId,
      success: function(data) {
        this.setState({feeds: {current: data.current, suggested: data.suggested}});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  render() {
    var self = this;
    var currentFeeds = this.state.feeds.current.map(function(curFeed) {
      return (<CurrentFeed key={curFeed.id} id={curFeed.id} feedTitle={curFeed.feed_title} profileID={self.props.profileID} onFeedDestroy={self.handleFeedDestroy} />)
    });
    var suggestedFeeds = this.state.feeds.suggested.map(function(sugFeed) {
      return (<SuggestedFeed key={sugFeed.id}  id={sugFeed.id} feedTitle={sugFeed.title} profileID={self.props.profileID} onFeedSubmit={self.handleFeedSubmit} />)
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
    );
  }
}