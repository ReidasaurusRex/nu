var CurrentFeed = React.createClass({
  handleDelete: function(e) {
    e.preventDefault();
    this.props.onFeedDestroy(this.props.id);
  },
  render: function() {
    return (
      <li className="c-rss-manage__section__li">

        <span className="c-rss-manage__section__li__left">{this.props.feedTitle}</span>

        <div className="c-rss-manage__section__li__remove">
      
          <span className="c-rss-manage__section__li__remove__prompt">
            <a className="u-text--apricot" href="#" title="Remove " + {this.props.feedTitle} onclick={this.handleDelete}>remove</a> 
          </span>
          
          <a className="c-rss-manage__section__li__button c-rss-manage__section__li__button--remove" href="#" title="Remove " + {this.props.feedTitle} onclick={this.handleDelete}>-</a>

        </div>

      </li>
    );
  }
});