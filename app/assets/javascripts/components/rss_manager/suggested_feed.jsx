var SuggestedFeed = React.createClass({
  render: function() {
    return (
      <li className="c-rss-manage__section__li">
        <h3 className="c-rss-manage__section__li__left">{this.props.feedTitle}</h3>
        <a href="#" onClick={this.handleSubmit} title="Add " + {this.feedTitle} className="c-rss-manage__section__li__button c-rss-manage__section__li__button--add">
      </li>      
    );
  }
});