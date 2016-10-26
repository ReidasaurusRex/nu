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
      }.bind(this)
    });
  },
  componentDidMount: function() {
    this.loadFeeds();
  }
});