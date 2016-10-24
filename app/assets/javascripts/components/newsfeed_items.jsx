var NewsfeedItems = React.createClass({
  getInitialState: function() {
    return  {data: []};
  },
  loadTenItems: function() {
    var currentData = this.state.data;
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      data: {current_index: currentData.length},
      cache: false,
      success: function(data) {
        this.setState({data: currentData.concat(data)});
        console.log(this.state.data);
      }.bind(this)
    });
  },
  loadTenMoreItems: function(e) {
    e.preventDefault();
    this.loadTenItems();
  },
  componentDidMount: function() {
    this.loadTenItems();
  },
  render: function() {
    var self = this;
    var items = this.state.data.map(function(item) {
      return (
        <li>{item.content}</li>
      )
    });
    return (
      <div className="c-newsfeed-list">
        <ul>
          {items}
        </ul>
        <a href="#" onClick={this.loadTenMoreItems}>Load ten more items</a>
      </div>
    );
  }
});