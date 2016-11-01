var NewsfeedItems = React.createClass({
  getInitialState: function() {
    return  {items: []};
  },
  loadTenItems: function() {
    var currentData = this.state.items;
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      data: {current_index: currentData.length},
      cache: false,
      success: function(data) {
        this.setState({items: currentData.concat(data.items)});
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
    var items = this.state.items.map(function(item) {
      if (item.source_type === "feed")
      {
        return (<FeedNewsfeedItem key={item.id} id={item.id} url={item.url} feed={item.feed} tsc={item.tsc} sourceName={item.source_name} image={item.image} currentProfileID={self.props.currentProfileID} likes={item.likes} comments={item.comments} />)
      } else {
        return (<NativeNewsfeedItem key={item.id} id={item.id} content={item.content} image={item.image} sourceName={item.source_name} tsc={item.tsc} currentProfileID={self.props.currentProfileID} likes={item.likes} comments={item.comments} />)
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