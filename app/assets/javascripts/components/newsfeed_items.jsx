var NewsfeedItems = React.createClass({
  getInitialState: function() {
    return  {data: []};
  },
  loadTenItems: function() {
    var currentData = this.state.data;
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: currentData.concat(data)});
      }
    });
  },
  render: function() {
    return (
      <div className="c-newsfeed-list">
        <h1>Hullo!</h1>
      </div>
    );
  }
});