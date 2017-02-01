class Comment extends React.Component {
  constructor() {
    super();
  }
  render() {
    var profileUrl = "/profiles/" + this.props.profileID;
    console.log(this.props.profilePhoto);
    return (
      <li className="o-media c-comments-list__li c-comments-list__comment">
        
        <img className="o-media__img o-img--tiny o-img--round c-comments-list__li__img" src={this.props.profilePhoto} />
        
        <div className="o-media__bd c-comments-list__li__bd">
          <a className="c-comments-list__li__bd__link" href={profileUrl}>{this.props.profileName}</a>
          {this.props.text}
        </div>

        <div className="o-media__ext c-comments-list__comment__pd u-text--edward">
          {this.props.tsc}
        </div>

      </li>
    );
  }
};