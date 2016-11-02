var NewCommentForm = React.createClass({
  render: function() {
    return (
      <li className="o-media c-comments-list__li c-comments-list__new">

        <img className="o-media__img o-img--tiny o-img--round c-comments-list__li__img" src={this.props.currentProfilePhoto} />

      </li>
    );
  }
});