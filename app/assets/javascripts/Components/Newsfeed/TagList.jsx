class TagList extends React.Component {
  render() {
    var self = this;
    var tagLinks = this.props.tags.map(function(tag) {
      var searchUrl = "/profiles/" + self.props.currentProfileID + "/search/results?query=" + tag.name;
      return (
        <li className="o-inline-list__li c-newsfeed-list__item__bd__tag" key={tag.id}>
          <a href={searchUrl}>#{tag.name}</a>
        </li>
      );
    });
    return (
      <ul className="o-inline-list">
        {tagLinks}
      </ul>
    );
  }
}