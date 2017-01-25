class Notification extends React.Component {
  constructor() {
    super();
  }
  render() {
    return (
      <li className="o-dropdown__li c-noti-dropdown__li">
        <img src={this.props.image} alt="" className="o-media__bd o-img--tiny o-img--round c-noti-dropdown__li__img "/>
        <p className="o-media__bd c-noti-dropdown__li__bd">{this.props.text}</p>
      </li>
    );
  }
}