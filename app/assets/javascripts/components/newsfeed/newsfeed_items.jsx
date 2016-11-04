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
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
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
  properItemType: function(item) {
    if (item.source_type === "feed") {
      return (<FeedNewsfeedItem id={item.id} url={item.url} feed={item.feed} tsc={item.tsc} sourceName={item.source_name} image={item.image} currentProfileID={this.props.currentProfileID} />)
    } else {
      return (<NativeNewsfeedItem id={item.id} content={item.content} image={item.image} sourceName={item.source_name} tsc={item.tsc} currentProfileID={this.props.currentProfileID} />)
    }
  },
  handleNewsfeedItemSubmit: function(itemAndTags) {
    $.ajax({
      url: this.props.url,
      type: 'POST', 
      dataType: 'json', 
      data: itemAndTags,
      cache: false,
      success: function(data) {
        var items = this.state.items;
        items.unshift(data.newsfeed_item);
        this.setState({items: items});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)

    });
  },
  addTagsUnlessEmpty: function(tags) {
    if (tags.length > 0) {
      return (<TagList tags={tags} currentProfileID={this.props.currentProfileID} />)
    }
  },
  render: function() {
    var self = this;
    var items = this.state.items.map(function(item) {
      return (
        <div key={item.id} className="o-bubble o-bubble--no-pad c-newsfeed-list__item">
          
          <div className="c-newsfeed-list__item--padding">
            
            {self.properItemType(item)}

            {self.addTagsUnlessEmpty(item.tags)}
            
            <SocialOverview likes={item.likes} comments={item.comments} currentProfileID={self.props.currentProfileID} newsfeedID={item.id} />

          </div>
            
          <Comments comments={item.comments} currentProfileID={self.props.currentProfileID} currentProfilePhoto={self.props.currentProfilePhoto} newsfeedID={item.id} />

        </div>
      )
      
    });
    return (
      <div className="c-newsfeed">
        <NewNewsfeedItemForm currentProfileID={this.props.currentProfileID} currentProfilePhoto={this.props.currentProfilePhoto} onNewsfeedItemSubmit={this.handleNewsfeedItemSubmit} />
        <div className="c-newsfeed-list">
          {items}
          <a href="#" onClick={this.loadTenMoreItems} className="c-newsfeed-list__load-more o-bubble">Load ten more items</a>
        </div>
      </div>
    );
  }
});