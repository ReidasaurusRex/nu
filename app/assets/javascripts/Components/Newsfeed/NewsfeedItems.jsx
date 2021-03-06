class NewsfeedItems extends React.Component {
  constructor() {
    super();
    this.loadTenItems = this.loadTenItems.bind(this);
    this.handleScroll = this.handleScroll.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.properItemType = this.properItemType.bind(this);
    this.handleNewsfeedItemSubmit = this.handleNewsfeedItemSubmit.bind(this);
    this.addTagsUnlessEmpty = this.addTagsUnlessEmpty.bind(this);
    this.state = {
      items: [],
      loading: false
    }
  }
  loadTenItems() {
    var currentData = this.state.items;
    this.setState({loading: true});
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      data: {current_index: currentData.length},
      cache: false,
      success: function(data) {
        this.setState({items: currentData.concat(data.items), loading: false});
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
        this.setState({loading: false});
      }.bind(this)
    });
  }
  componentDidMount() {
    this.loadTenItems();
    window.addEventListener('scroll', this.handleScroll);
  }
  componentWillUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  }
  handleScroll() {
    var self = this;  
    if (($(window).scrollTop() + $(window).height() > $(document).height() - 50) && (!self.state.loading)) {
     self.loadTenItems();
    }
  }
  handleDelete(id) {
    var destroyUrl = this.props.url + "/" + id;
    $.ajax({
      url: destroyUrl,
      dataType: 'json', 
      type: 'DELETE',
      success: function() {
        var items = this.state.items;
        var index = -1;
        for (var i = 0; i < items.length; i++) {
          if (items[i].id === id) {
            index = i;
            break;
          }
        }
        if (index > -1) {
          items.splice(index, 1);
          this.setState({items: items});
        }
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
  properItemType(item) {
    if (item.source_type === "feed") {
      return (<FeedNewsfeedItem id={item.id} url={item.url} feed={item.feed} tsc={item.tsc} sourceName={item.source_name} image={item.image} currentProfileID={this.props.currentProfileID} />)
    } else {
      return (<NativeNewsfeedItem id={item.id} content={item.content} image={item.image} sourceName={item.source_name} sourceID={item.source_id} tsc={item.tsc} currentProfileID={this.props.currentProfileID} onDelete={this.handleDelete} />)
    }
  }
  handleNewsfeedItemSubmit(itemAndTags) {
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
  }
  addTagsUnlessEmpty(tags) {
    if (tags.length > 0) {
      return (<TagList tags={tags} currentProfileID={this.props.currentProfileID} />)
    }
  }
  render() {
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
        </div>
      </div>
    );
  }
}