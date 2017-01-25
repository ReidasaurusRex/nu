class Notification extends React.Component {
  constructor() {
    super();
    this.properClassName = this.properClassName.bind(this);
  }
  properClassName() {
    var className = "o-dropdown__li c-noti-dropdown__li";
    if (this.props.unseen) {
      console.log("Unseen: " + this.props.text);
      className += " c-noti-dropdown__li--unseen"
    }
    return className;
  }
  render() {
    return (
      <li className={this.properClassName()}>
        <img src={this.props.image} alt="" className="o-media__bd o-img--tiny o-img--round c-noti-dropdown__li__img "/>
        <p className="o-media__bd c-noti-dropdown__li__bd">{this.props.text}</p>
      </li>
    );
  }
}