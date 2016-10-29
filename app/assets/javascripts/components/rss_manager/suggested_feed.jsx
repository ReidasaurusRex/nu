var SuggestedFeed = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    this.props.onFeedSubmit({profile_feed: {feed_id: this.props.id, profile_id: this.props.profileID}});
  },
  render: function() {
    var addPrompt = "Add " + this.props.feedTitle;
    return (
      <li className="c-rss-manage__section__li">
        <h3 className="c-rss-manage__section__li__left">{this.props.feedTitle}</h3>
        <a href="#" onClick={this.handleSubmit} title={addPrompt} className="c-rss-manage__section__li__button c-rss-manage__section__li__button--add">+</a>
      </li>      
    );
  }
});