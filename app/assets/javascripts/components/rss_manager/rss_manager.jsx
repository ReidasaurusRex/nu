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
  handleSubmit: function() {

  },
  handleDestroy: function() {
    
  },
  render: function() {
    return (
      <div>
        <h2>Hello!</h2>
      </div>
    )
  }
});