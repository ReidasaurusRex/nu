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
        console.log(data.items);
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
  properItemType: function(item) {
    if (item.source_type === "feed") {
      return (<FeedNewsfeedItem id={item.id} url={item.url} feed={item.feed} tsc={item.tsc} sourceName={item.source_name} image={item.image} currentProfileID={this.props.currentProfileID} currentProfilePhoto={this.props.currentProfilePhoto} likes={item.likes} comments={item.comments} />)
    } else {
      return (<NativeNewsfeedItem id={item.id} content={item.content} image={item.image} sourceName={item.source_name} tsc={item.tsc} currentProfileID={this.props.currentProfileID} currentProfilePhoto={this.props.currentProfilePhoto} likes={item.likes} comments={item.comments} />)
    }
  },
  render: function() {
    var self = this;
    var items = this.state.items.map(function(item) {
      return (
        <div key={item.id} className="o-bubble o-bubble--no-pad c-newsfeed-list__item">
          <div className="c-newsfeed-list__item--padding">
            
            {self.properItemType(item)}
            
            <SocialOverview likes={item.likes} comments={item.comments} currentProfileID={self.props.currentProfileID} newsfeedID={item.id} />
            
            <Comments comments={item.comments} currentProfileID={self.props.currentProfileID} currentProfilePhoto={self.props.currentProfilePhoto} newsfeedID={item.id} />

          </div>

        </div>
      )
      
    });
    return (
      <div className="c-newsfeed-list">
        {items}
        <a href="#" onClick={this.loadTenMoreItems} className="c-newsfeed-list__load-more o-bubble">Load ten more items</a>
      </div>
    );
  }
});