class FeedNewsfeedItem extends React.Component {
  constructor() {
    super();
    this.imageOrNot = this.imageOrNot.bind(this);
    this.handleMenuClick = this.handleMenuClick.bind(this);
    this.state = {
      displayMenu: false
    }
  }
  imageOrNot() {
    if (this.props.image) {
      return (
        <div className="o-media__img">
          <img src={this.props.image} alt="" className="c-rss-newsfeed_item__media__img"/>
        </div>
      )
    } else {
      return false;
    }
  }
  handleMenuClick() {
    if (!this.state.displayMenu) {
      this.setState({displayMenu: true});
    } else {
      this.setState({displayMenu: false});
    }
  }
  render() {
    return (
      <div>
        <h3 className="c-newsfeed-list__item__title c-newsfeed-list__item__text">
          {this.props.feed}
          <span className="c-newsfeed-list__item__pd">RSS • {this.props.tsc}</span>
          <span onClick={this.handleMenuClick}><i className="fa fa-angle-down c-newsfeed-list__item__menu-prompt"></i></span>
        </h3>

        <div className="o-media c-rss-newsfeed-item__media">

          {this.imageOrNot()}

          <div className="o-media__bd c-rss-newsfeed-item__media__bd">

            <p className="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text">{this.props.sourceName}</p>
            <p className="c-newsfeed-list__item__text c-rss-newsfeed-item__media__bd__text"><a href={this.props.url} className="u-text--apricot" target="_blank">View Article</a></p>

          </div>

        </div>
      </div>
    );
  }
};