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
      if (item.source_type === "feed")
      {
        return (<FeedNewsfeedItem key={item.id} url={item.url} feed={item.feed} tsc={item.tsc} sourceName={item.source_name} image={item.image} />)
      } else {
        return (<NativeNewsfeedItem key={item.id} content={item.content} image={item.image} sourceName={item.source_name} tsc={item.tsc}/>)
      }
    });
    return (
      <div className="c-newsfeed-list">
        {items}
        <a href="#" onClick={this.loadTenMoreItems} className="c-newsfeed-list__load-more o-bubble">Load ten more items</a>
      </div>
    );
  }
});